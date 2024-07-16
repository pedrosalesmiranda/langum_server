"""
TODO
- initialize database conn cursor modulo scope not init all the time
- can be class

list of tuples in format ( expression, phonetic native reading of expression split in syllabus read by PORTUGUESE speaker )
make me a list of tuples where will be in the format ( original expression, phonetic reading of expression split in syllabs but has read by portuguese speaker)
"""

import json
import re
from datetime import datetime
import socket

from gtts import gTTS
from flask import Flask, send_from_directory, request, abort, jsonify
import sqlite3
from flask_cors import CORS

import os

app = Flask(__name__)
CORS(app)  # This will enable CORS for all routes JUST FOR WEB mobile we can delete it

# Ensure this path points to the directory where your sound files are stored
SOUND_FILES_DIRECTORY = 'sounds'


def generate_all_language_sounds(langEng: str):
    conn = sqlite3.connect('langum.db')
    cursor = conn.cursor()

    # Find the language by languageEng
    cursor.execute("SELECT id, languageEngTwoLetters FROM Languages WHERE languageEng = ?", (langEng,))
    language = cursor.fetchone()

    if not language:
        raise Exception(f"Language '{langEng}' not found.")

    language_id, lang_2_letters = language

    # Get all expressions with this language_id
    cursor.execute("SELECT text, sound_filename FROM Expressions WHERE language_id = ?", (language_id,))
    expressions = cursor.fetchall()

    # Ensure the folder exists
    create_folder_if_not_exists(lang_2_letters)

    # Generate sound for each expression
    for expression, sound_filename in expressions:
        generateSoundExpression(expression, sound_filename, lang_2_letters)

    conn.close()


def create_folder_if_not_exists(folder_path: str):
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)


def file_exists(file_path: str):
    return os.path.isfile(file_path)


def generateSoundExpression(expression: str, sound_filename: str, lang_2_letters: str):
    file_path = f"{lang_2_letters}/{sound_filename.lower()}.mp3"
    if file_exists(file_path):
        return
    tts = gTTS(expression.lower(), lang=lang_2_letters)
    tts.save(file_path)


def remove_special_characters(expression):
    return re.sub(r'[^a-zA-Z0-9\s_]', '', expression)


def get_language_packs(target_language_id, base_language_id):
    """
    return expressions grouped per pack for a given language with base language needed fields too
    :param target_language_id:
    :param base_language_id:
    :return:
    """
    conn = sqlite3.connect('langum.db')  # Replace 'your_database.db' with your actual database file
    cursor = conn.cursor()

    query_language = '''
SELECT PM.pack_id       AS pack_id,
       E.text           AS expression_text,
       E.sound_filename AS expression_sound,
       E.language_id    AS language_id,
       P.text           AS expression_phonetic,
       M.id             AS meaning_id,
       PTL.title        AS pack_title,
       E.id             AS expression_id,
       P.id             AS phonetic_id

FROM Meanings M
         JOIN Expressions E ON M.id = E.meaning_id
         JOIN Languages L ON E.language_id = L.id
         LEFT JOIN Phonetics P ON E.id = P.expression_id AND :base_language_id = P.language_id
         JOIN PackMeaning PM ON PM.meaning_id = M.id
         LEFT JOIN PackTitleLanguage PTL on PM.pack_id = PTL.pack_id
WHERE L.id IN (:target_language_id, :base_language_id)
  and PTL.language_id = :base_language_id;
    '''

    params = {
        'target_language_id': target_language_id,
        'base_language_id': base_language_id
    }
    cursor.execute(query_language, params)

    res_expressions = cursor.fetchall()
    conn.close()

    # Organize data into a dictionary by packId
    packs = {}
    expressions_key = "expressions"
    for row in res_expressions:
        pack_id, expression_text, expression_sound, language_id, expression_phonetic, meaning_id, pack_title, expression_id, phonetic_id = row
        if pack_id not in packs:
            packs[pack_id] = {"pack_id": pack_id, "pack_title": pack_title}

        if expressions_key not in packs[pack_id]:
            packs[pack_id][expressions_key] = {}

        if meaning_id not in packs[pack_id][expressions_key]:
            packs[pack_id][expressions_key][meaning_id] = {}

        if language_id == target_language_id:
            packs[pack_id][expressions_key][meaning_id]["expression_text"] = expression_text
            packs[pack_id][expressions_key][meaning_id]["expression_sound"] = expression_sound
            packs[pack_id][expressions_key][meaning_id]["language_id"] = language_id
            packs[pack_id][expressions_key][meaning_id]["expression_phonetic"] = expression_phonetic
            packs[pack_id][expressions_key][meaning_id]["phonetic_id"] = phonetic_id
            packs[pack_id][expressions_key][meaning_id]["meaning_id"] = meaning_id
            packs[pack_id][expressions_key][meaning_id]["expression_id"] = expression_id
        if language_id == base_language_id:
            packs[pack_id][expressions_key][meaning_id]["expression_base_text"] = expression_text
            packs[pack_id][expressions_key][meaning_id]["expression_base_sound"] = expression_sound
            packs[pack_id][expressions_key][meaning_id]["language_base_id"] = language_id

    packs_list = []
    for pack_key, pack_value in packs.items():
        expressions_list = list(pack_value[expressions_key].values())
        packs_list.append({"pack_id": pack_value["pack_id"], "pack_title": pack_value["pack_title"],
                           expressions_key: expressions_list})

    return packs_list


# needs to be reviewed TODO buggy code
@app.route('/download_sound', methods=['GET'])
def download_file():
    filename = request.args.get('filename')
    filename_mp3 = f"{filename}.mp3"
    if filename[0] == "r":
        letters2 = "ru"
    else:
        letters2 = "pt"
    if not filename:
        abort(400, description="Filename parameter is missing.")

    # Check if the file exists
    if not os.path.exists(os.path.join(letters2, filename_mp3)):
        abort(404, description="File not found.")

    return send_from_directory(letters2, filename_mp3, as_attachment=True)


@app.route('/create_evaluation', methods=['POST'])
def add_evaluation():
    data = request.get_json()

    # Extract data from the JSON request
    type_ = data.get('type')
    goal = data.get('goal')
    start = datetime.strptime(data.get('start'), '%Y-%m-%dT%H:%M:%S')
    end = datetime.strptime(data.get('end'), '%Y-%m-%dT%H:%M:%S')
    expressions = data.get('expressions', [])

    # Validate data
    if not type_ or not goal or not start or not end or not expressions:
        return jsonify({'error': 'Missing required fields'}), 400

    conn = sqlite3.connect('langum.db')  # Replace 'your_database.db' with your actual database file
    cursor = conn.cursor()

    try:
        # Create and add new evaluation
        cursor.execute('''
            INSERT INTO Evaluations (type, goal, start, end, size)
            VALUES (?, ?, ?, ?, ?)
        ''', (type_, goal, start, end, len(expressions)))

        evaluation_id = cursor.lastrowid

        # Add evaluation expressions
        for expr in expressions:
            expression_id = expr.get('expression_id')
            grade = expr.get('grade')
            duration = expr.get('duration')

            if expression_id is None or grade is None or duration is None:
                conn.rollback()
                return jsonify({'error': 'Missing fields in expressions'}), 400

            cursor.execute('''
                INSERT INTO EvaluationExpression (expression_id, evaluation_id, grade, duration)
                VALUES (?, ?, ?, ?)
            ''', (expression_id, evaluation_id, grade, duration))

        conn.commit()
        return jsonify({'message': 'Evaluation added successfully'}), 201

    except sqlite3.Error as e:
        conn.rollback()
        return jsonify({'error': str(e)}), 500

    finally:
        conn.close()


@app.route('/list_packs', methods=['GET'])
def get_packs_endpoint():
    target_language_id = request.args.get('targetLanguageId')
    base_language_id = request.args.get('baseLanguageId')

    if not target_language_id or not base_language_id:
        return jsonify({'error': 'targetLanguageId and baseLanguageId are required'}), 400

    try:
        target_language_id = int(target_language_id)
        base_language_id = int(base_language_id)
    except ValueError:
        return jsonify({'error': 'Invalid language ID format'}), 400

    packs = get_language_packs(target_language_id, base_language_id)
    return jsonify(packs)


@app.route('/create_phonetic', methods=['POST'])
def create_phonetic():
    data = request.json
    language_id = data.get('languageId')
    expression_id = data.get('expressionId')
    text = data.get('text')

    if not all([language_id, expression_id, text]):
        return jsonify({'error': 'Missing data'}), 400

    try:
        conn = sqlite3.connect('langum.db')  # Replace 'your_database.db' with your actual database file
        cursor = conn.cursor()

        # Check if the phonetic already exists
        cursor.execute('''
                   SELECT id FROM Phonetics WHERE language_id = ? AND expression_id = ?
               ''', (language_id, expression_id))
        phonetic = cursor.fetchone()

        if phonetic:
            conn.close()
            return jsonify({'error': 'Phonetic already exists'}), 409  # Conflict status code
        else:
            cursor.execute('''
                INSERT INTO Phonetics (text, language_id, expression_id)
                VALUES (?, ?, ?)
            ''', (text, language_id, expression_id))
            conn.commit()
            phonetic_id = cursor.lastrowid
            conn.close()
            return jsonify(
                {'id': phonetic_id, 'text': text, 'language_id': language_id, 'expression_id': expression_id}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500


@app.route('/update_phonetic_text', methods=['PATCH'])
def update_phonetic_text():
    data = request.json
    phonetic_id = data.get('phoneticId')
    text = data.get('text')

    if not all([phonetic_id, text]):
        return jsonify({'error': 'Missing phoneticId or text'}), 400

    try:
        conn = sqlite3.connect('langum.db')  # Replace 'your_database.db' with your actual database file
        cursor = conn.cursor()

        # Check if the phonetic exists
        cursor.execute('''
            SELECT * FROM Phonetics WHERE id = ?
        ''', (phonetic_id,))
        phonetic = cursor.fetchone()

        if phonetic:
            # Update the phonetic text
            cursor.execute('''
                UPDATE Phonetics SET text = ? WHERE id = ?
            ''', (text, phonetic_id))
            conn.commit()
            conn.close()

            return jsonify({'id': phonetic_id, 'text': text}), 200
        else:
            conn.close()
            return jsonify({'error': 'Phonetic not found'}), 404
    except Exception as e:
        return jsonify({'error': str(e)}), 500


def save_json_file(filename: str, json_dict: dict, folder_path="", indent=4):
    with open(f"{folder_path}/{filename}", "w") as outfile:
        json.dump(json_dict, outfile, indent=indent)


@app.route('/evaluation/<int:evaluation_id>', methods=['GET'])
def get_evaluation(evaluation_id):
    conn = sqlite3.connect('langum.db')  # Replace 'your_database.db' with your actual database file
    cursor = conn.cursor()

    query_evaluation = '''
    SELECT E.id    AS eval_id,
       E.start AS eval_start,
       e.end   AS eval_end,
       E.goal  AS eval_goal,
       E.type  AS eval_type,
       E.size  AS eval_size
FROM Evaluations E WHERE id = :evaluation_id'''

    params = {
        'evaluation_id': evaluation_id,
    }
    cursor.execute(query_evaluation, params)
    evaluation = cursor.fetchone()

    if evaluation is None:
        return jsonify({'error': 'Evaluation not found'}), 404

    eval_id, eval_start, eval_end, eval_goal, eval_type, eval_size = evaluation

    # Convert evaluation to a dictionary
    evaluation_dict = {
        'id': eval_id,
        'type': eval_type,
        'goal': eval_goal,
        'start': eval_start,
        'end': eval_end,
        'size': eval_size
    }

    query_evaluation_expression = '''SELECT EE.id AS ee_id,
       EE.expression_id AS expression_id,
       EE.evaluation_id AS evaluation_id,
       EE.duration  AS evaluation_duration,
       EE.grade AS evaluation_grade
FROM EvaluationExpression EE WHERE evaluation_id = :evaluation_id'''

    # Fetch the associated evaluation expressions
    params = {
        'evaluation_id': evaluation_id,
    }
    cursor.execute(query_evaluation_expression, params)
    evaluation_expressions = cursor.fetchall()

    # Convert evaluation expressions to a list of dictionaries
    evaluation_expressions_list = []
    for expression in evaluation_expressions:
        ee_id, expression_id, evaluation_id, evaluation_duration, evaluation_grade = expression
        evaluation_expressions_list.append({
            'id': ee_id,
            'expression_id': expression_id,
            'evaluation_id': evaluation_id,
            'grade': evaluation_grade,
            'duration': evaluation_duration
        })

    # Combine both into a single response
    response = {
        'evaluation': evaluation_dict,
        'evaluation_expressions': evaluation_expressions_list
    }

    return jsonify(response)


def create_expressions(expressions, languageEng):
    """
    Create new expressions in the Expressions table.

    :param expressions: list of tuples (text, meaningEng)
    :param languageEng: language in English
    """
    try:
        # Connect to the SQLite database
        conn = sqlite3.connect("langum.db")
        cursor = conn.cursor()

        # Check if the languageEng exists in the Languages table
        cursor.execute("SELECT id FROM Languages WHERE languageEng = ?", (languageEng,))
        language_row = cursor.fetchone()

        if language_row is None:
            raise ValueError(f"Language '{languageEng}' does not exist.")

        language_id = language_row[0]

        for text, meaningEng in expressions:
            # Check if the meaningEng already exists in the Meanings table
            cursor.execute("SELECT id FROM Meanings WHERE meaningEng = ?", (meaningEng,))
            meaning_row = cursor.fetchone()

            if meaning_row is None:
                # Insert the new meaningEng into the Meanings table
                cursor.execute("INSERT INTO Meanings (meaningEng) VALUES (?)", (meaningEng,))
                conn.commit()
                meaning_id = cursor.lastrowid
            else:
                meaning_id = meaning_row[0]

            # Check if the expression text already exists in the Expressions table
            cursor.execute("SELECT id FROM Expressions WHERE text = ?", (text,))
            expression_row = cursor.fetchone()

            if expression_row is not None:
                print(f"Expression text '{text}' already exists.")
                continue

            # Generate the sound_filename
            sound_filename = f"{languageEng.lower()}__{remove_special_characters(meaningEng.lower().replace(' ', '_'))}"

            # Insert the new expression into the Expressions table
            cursor.execute('''
                INSERT INTO Expressions (text, sound_filename, language_id, meaning_id)
                VALUES (?, ?, ?, ?)
            ''', (text, sound_filename, language_id, meaning_id))

        # Commit the transaction
        conn.commit()

        print("Expressions created successfully.")

        # Close the connection
        cursor.close()
        conn.close()

    except sqlite3.Error as e:
        print(f"Error: {e}")


# TODO not working yet
def create_phonetics(data_list):
    """
    Inserts a list of tuples with (expressionText, phonetics) into the Phonetics table.

    Parameters:
        data_list (list of tuples): List containing tuples with (expressionText, phonetics)
        db_path (str): Path to the SQLite database file

    Example:
        data_list = [("Hello", "həˈloʊ"), ("Goodbye", "ɡʊdˈbaɪ")]
        insert_phonetics(data_list, 'my_database.db')
    """
    try:
        # Connect to the SQLite database
        conn = sqlite3.connect("langum.db")
        cursor = conn.cursor()

        # Begin a transaction
        cursor.execute("BEGIN TRANSACTION;")

        # Prepare the SQL statement for inserting data
        insert_sql = """
        INSERT INTO Phonetics (text, language_id, expression_id)
        SELECT ?, l.id, e.id
        FROM Expressions e
        JOIN Languages l ON l.languageEngTwoLetters = 'en'  -- Replace 'en' with the desired language code if needed
        WHERE e.text = ? AND l.languageEngTwoLetters = 'en';  -- Adjust the conditions as per your requirements
        """

        # Iterate over the list and insert each tuple
        for expression_text, phonetic_text in data_list:
            # Fetch the expression_id and language_id (Assuming English with code 'en')
            cursor.execute(insert_sql, (phonetic_text, expression_text))

        # Commit the transaction
        conn.commit()
        print(f"{len(data_list)} rows inserted successfully.")

    except sqlite3.Error as e:
        # Rollback the transaction in case of an error
        if conn:
            conn.rollback()
        print(f"An error occurred: {e}")

    finally:
        # Close the database connection
        if conn:
            conn.close()

def phonetics_insert_console():
    phonetics = [
        ("Добрый вечер", "Dó-bri ve-chér"),
        ("Где находится...?", "Gdê na-kho-dí-tsya...?"),
        ("Как вас зовут?", "Kak vas zo-vut?"),
        ("Я люблю тебя", "Ya lyu-blyu te-bya"),
        ("Можно ли...?", "Mózh-na li...?"),
        ("Что это?", "Shto é-tâ?"),
        ("Когда?", "Kag-dá?"),
        ("Почему?", "Pach-e-mú?"),
        ("Кто?", "Kto?"),
        ("Как?", "Kak?"),
        ("Где?", "Gdê?"),
        ("Что вы сказали?", "Shto vy ská-za-li?"),
        ("Повторите, пожалуйста", "Pav-ta-ryi-te, pa-zhá-luysta"),
        ("Я не знаю", "Ya nye zna-yu"),
        ("Я заблудился", "Ya zab-lu-díl-sya"),
        ("Какой адрес?", "Ka-kóy ad-res?"),
        ("У вас есть...?", "U vas yest’...?"),
        ("Можно мне...?", "Mózh-na mne...?"),
        ("Я хочу...", "Ya kha-chú..."),
        ("Могу я...?", "Ma-gu ya...?"),
        ("Говорите медленнее, пожалуйста", "Go-va-rí-te myed-len-né-ye, pa-zhá-luysta"),
        ("Счастливого пути", "Scha-stli-vó-va pu-tí"),
        ("Удачи", "U-dá-chi"),
        ("С праздником", "S praz-dni-kom"),
        ("С Днём Рождения", "S Dnyóm Rozh-dé-ní-ya"),
        ("Мои соболезнования", "Ma-í so-ba-léz-no-va-ni-ya"),
        ("До встречи", "Da vstré-chi"),
        ("Это правда?", "É-tâ prav-da?"),
        ("Я согласен", "Ya sa-gla-syen"),
        ("Я не согласен", "Ya nye sa-gla-syen"),
        ("Мне нравится", "Mne nrá-vi-tsa"),
        ("Мне не нравится", "Mne nye nrá-vi-tsa"),
        ("Я устал", "Ya us-tál"),
        ("Я голоден", "Ya go-lo-den"),
        ("Я хочу пить", "Ya kha-chú pit’"),
        ("Я болею", "Ya ba-lé-yu"),
        ("У меня болит...", "U me-nya ba-lít..."),
        ("Какой сегодня день?", "Ka-kóy sye-vo-dn-ya dên’?"),
        ("Который час?", "Ka-tó-ryi chás?"),
        ("Сколько вам лет?", "Skol’-ka vam lyet?"),
        ("Где ты живёшь?", "Gdê ty zhiv-yósh?"),
        ("Откуда ты?", "Ot-kú-da ty?"),
        ("Что ты делаешь?", "Shto ty dýe-lá-esh’?"),
        ("Что случилось?", "Shto sloo-chí-los’?"),
        ("Ты замужем?", "Ty za-mú-zhem?"),
        ("Ты женат?", "Ty zhe-nát?"),
        ("У вас есть дети?", "U vas yest’ dýe-ti?"),
        ("Какой ваш телефон?", "Ka-kóy vash te-le-fón?"),
        ("Какие планы на сегодня?", "Ka-kí-ye plá-ny na sye-vo-dn-yâ?"),
        ("Ты любишь читать?", "Ty lyu-bish’ chi-tát’?"),
        ("Какая твоя любимая книга?", "Ka-ká-ya tvá-ya lyu-bí-má-ya kní-ga?"),
        ("Какая твоя любимая музыка?", "Ka-ká-ya tvá-ya lyu-bí-má-ya mú-zi-ka?"),
        ("Какие фильмы ты любишь?", "Ka-kí-ye fí-lmy ty lyu-bish’?"),
        ("Ты занимаешься спортом?", "Ty za-ni-má-yesh’sya spór-tom?"),
        ("Как пройти до...?", "Kak pro-í-ti do...?"),
        ("Можно вашу помощь?", "Mózh-na vá-shu po-móshch’?"),
        ("Могу я вам помочь?", "Ma-gu ya vam po-mó-ch?"),
        ("Не беспокойтесь", "Nye bes-po-kóy-tes’"),
        ("Скорую помощь", "Skó-ru-yu po-móshch’"),
        ("Где ближайшая аптека?", "Gdê blizhá-ya-ya ap-té-ka?"),
        ("Я забронировал номер", "Ya za-bro-ní-ro-val nó-mer"),
        ("Мне нужен номер на одну ночь", "Mne nu-zhén nó-mer na ad-nú noch’"),
        ("Сколько стоит за ночь?", "Skol’-ka stó-it za noch’?"),
        ("Вы принимаете кредитные карты?", "Vy pri-ny-má-ye-te kre-dít-ny-e kár-ty?"),
        ("Где ближайший банкомат?", "Gdê blizhá-yi shí ban-ko-mát?"),
        ("Сколько времени займёт?", "Skol’-ka vré-mé-ni zay-myót?"),
        ("Это далеко?", "É-tâ da-lé-kó?"),
        ("Можно счёт, пожалуйста?", "Mózh-na schyót, pa-zhá-luysta?"),
        ("Могу я расплатиться наличными?", "Ma-gu ya ras-plá-ti-tsa na-lí-chny-mi?"),
        ("Где ближайшая станция метро?", "Gdê blizhá-ya-ya stán-tsi-ya me-tró?"),
        ("Как доехать до центра города?", "Kak do-ye-khat’ do tsén-tra gó-ro-da?"),
        ("У меня есть вопрос", "U me-nya yest’ va-prós"),
        ("Говорите громче, пожалуйста", "Go-va-rí-te gróm-ché, pa-zhá-luysta"),
        ("Скажите ещё раз", "Ská-zhí-te yeshchó raz"),
        ("Откройте, пожалуйста", "Ot-kró-yte, pa-zhá-luysta"),
        ("Закройте, пожалуйста", "Za-kró-yte, pa-zhá-luysta"),
        ("Войдите", "Vói-dí-te"),
        ("Выходите", "Vý-kho-dí-te"),
        ("Приятного аппетита", "Pri-yát-na-va ap-pi-tí-ta")
    ]

    create_phonetics(phonetics)


def insert_expressions_console():
    expressions = [
        ("Onde está...?", "Where is...?"),
        ("Qual é o seu nome?", "What's your name?"),
        ("Eu te amo", "I love you"),
        ("É possível...?", "Is it possible...?"),
        ("O que é isso?", "What is this?"),
        ("Quando?", "When?"),
        ("Por quê?", "Why?"),
        ("Quem?", "Who?"),
        ("Como?", "How?"),
        ("Onde?", "Where?"),
        ("O que você disse?", "What did you say?"),
        ("Por favor, repita", "Please repeat"),
        ("Eu não sei", "I don't know"),
        ("Estou perdido", "I'm lost"),
        ("Qual é o endereço?", "What is the address?"),
        ("Você tem...?", "Do you have...?"),
        ("Posso ter...?", "Can I have...?"),
        ("Eu quero...", "I want..."),
        ("Posso...?", "May I...?"),
        ("Fale mais devagar, por favor", "Speak slower, please"),
        ("Tenha uma boa viagem", "Have a good trip"),
        ("Boa sorte", "Good luck"),
        ("Boas festas", "Happy holiday"),
        ("Feliz Aniversário", "Happy Birthday"),
        ("Meus pêsames", "My condolences"),
        ("Até logo", "See you later"),
        ("É verdade?", "Is it true?"),
        ("Eu concordo", "I agree"),
        ("Eu discordo", "I disagree"),
        ("Eu gosto", "I like it"),
        ("Eu não gosto", "I don't like it"),
        ("Estou cansado", "I'm tired"),
        ("Estou com fome", "I'm hungry"),
        ("Estou com sede", "I'm thirsty"),
        ("Estou doente", "I'm sick"),
        ("Eu tenho uma dor em...", "I have a pain in..."),
        ("Que dia é hoje?", "What day is it today?"),
        ("Que horas são?", "What time is it?"),
        ("Quantos anos você tem?", "How old are you?"),
        ("Onde você mora?", "Where do you live?"),
        ("De onde você é?", "Where are you from?"),
        ("O que você está fazendo?", "What are you doing?"),
        ("O que aconteceu?", "What happened?"),
        ("Você é casada?", "Are you married? (to a woman)"),
        ("Você é casado?", "Are you married? (to a man)"),
        ("Você tem filhos?", "Do you have children?"),
        ("Qual é o seu número de telefone?", "What’s your phone number?"),
        ("Quais são seus planos para hoje?", "What are your plans for today?"),
        ("Você gosta de ler?", "Do you like reading?"),
        ("Qual é o seu livro favorito?", "What is your favorite book?"),
        ("Qual é a sua música favorita?", "What is your favorite music?"),
        ("Que filmes você gosta?", "What movies do you like?"),
        ("Você pratica esportes?", "Do you do sports?"),
        ("Como chegar a...?", "How to get to...?"),
        ("Posso ter a sua ajuda?", "Can I have your help?"),
        ("Posso te ajudar?", "Can I help you?"),
        ("Não se preocupe", "Don’t worry"),
        ("Chame uma ambulância", "Call an ambulance"),
        ("Onde fica a farmácia mais próxima?", "Where is the nearest pharmacy?"),
        ("Eu tenho uma reserva", "I have a reservation"),
        ("Eu preciso de um quarto para uma noite", "I need a room for one night"),
        ("Quanto custa por noite?", "How much is per night?"),
        ("Vocês aceitam cartões de crédito?", "Do you accept credit cards?"),
        ("Onde fica o caixa eletrônico mais próximo?", "Where is the nearest ATM?"),
        ("Quanto tempo vai demorar?", "How long will it take?"),
        ("É longe?", "Is it far?"),
        ("Pode trazer a conta, por favor?", "Can I have the bill, please?"),
        ("Posso pagar em dinheiro?", "Can I pay in cash?"),
        ("Onde fica a estação de metrô mais próxima?", "Where is the nearest metro station?"),
        ("Como chegar ao centro da cidade?", "How to get to the city center?"),
        ("Eu tenho uma pergunta", "I have a question"),
        ("Fale mais alto, por favor", "Speak louder, please"),
        ("Diga novamente", "Say it again"),
        ("Abra, por favor", "Open, please"),
        ("Feche, por favor", "Close, please"),
        ("Entre", "Come in"),
        ("Saia", "Go out"),
        ("Bom apetite", "Enjoy your meal")]

    languageEng = 'portuguese'



    # expressions = [
    #     ("Привет", "Hello"),
    #     ("Как дела?", "How are you?"),
    #     ("Спасибо", "Thank you"),
    #     ("Пожалуйста", "Please"),
    #     ("Пожалуйста", "You're welcome"),
    #     ("Да", "Yes"),
    #     ("Нет", "No"),
    #     ("Извините", "Excuse me"),
    #     ("Извините", "Sorry"),
    #     ("До свидания", "Goodbye"),
    #     ("Доброе утро", "Good morning"),
    #     ("Добрый день", "Good afternoon"),
    #     ("Добрый вечер", "Good evening"),
    #     ("Спокойной ночи", "Good night"),
    #     ("Я не понимаю", "I don't understand"),
    #     ("Где находится...?", "Where is...?"),
    #     ("Сколько это стоит?", "How much does it cost?"),
    #     ("Меня зовут...", "My name is..."),
    #     ("Как вас зовут?", "What's your name?"),
    #     ("Очень приятно", "Nice to meet you"),
    #     ("До скорого", "See you soon"),
    #     ("Я люблю тебя", "I love you"),
    #     ("Помогите!", "Help!"),
    #     ("Можно ли...?", "Is it possible...?"),
    #     ("Что это?", "What is this?"),
    #     ("Когда?", "When?"),
    #     ("Почему?", "Why?"),
    #     ("Кто?", "Who?"),
    #     ("Как?", "How?"),
    #     ("Где?", "Where?"),
    #     ("Что вы сказали?", "What did you say?"),
    #     ("Повторите, пожалуйста", "Please repeat"),
    #     ("Я не знаю", "I don't know"),
    #     ("Я заблудился", "I'm lost"),
    #     ("Какой адрес?", "What is the address?"),
    #     ("У вас есть...?", "Do you have...?"),
    #     ("Можно мне...?", "Can I have...?"),
    #     ("Я хочу...", "I want..."),
    #     ("Могу я...?", "May I...?"),
    #     ("Вы говорите по-английски?", "Do you speak English?"),
    #     ("Говорите медленнее, пожалуйста", "Speak slower, please"),
    #     ("Счастливого пути", "Have a good trip"),
    #     ("Поздравляю", "Congratulations"),
    #     ("Удачи", "Good luck"),
    #     ("С праздником", "Happy holiday"),
    #     ("С Днём Рождения", "Happy Birthday"),
    #     ("Мои соболезнования", "My condolences"),
    #     ("До встречи", "See you later"),
    #     ("Это правда?", "Is it true?"),
    #     ("Я согласен", "I agree"),
    #     ("Я не согласен", "I disagree"),
    #     ("Мне нравится", "I like it"),
    #     ("Мне не нравится", "I don't like it"),
    #     ("Я устал", "I'm tired"),
    #     ("Я голоден", "I'm hungry"),
    #     ("Я хочу пить", "I'm thirsty"),
    #     ("Я болею", "I'm sick"),
    #     ("У меня болит...", "I have a pain in..."),
    #     ("Как тебя зовут?", "What’s your name?"),
    #     ("Какой сегодня день?", "What day is it today?"),
    #     ("Который час?", "What time is it?"),
    #     ("Сколько вам лет?", "How old are you?"),
    #     ("Где ты живёшь?", "Where do you live?"),
    #     ("Откуда ты?", "Where are you from?"),
    #     ("Что ты делаешь?", "What are you doing?"),
    #     ("Что случилось?", "What happened?"),
    #     ("Ты замужем?", "Are you married? (to a woman)"),
    #     ("Ты женат?", "Are you married? (to a man)"),
    #     ("У вас есть дети?", "Do you have children?"),
    #     ("Какой ваш телефон?", "What’s your phone number?"),
    #     ("Какие планы на сегодня?", "What are your plans for today?"),
    #     ("Ты любишь читать?", "Do you like reading?"),
    #     ("Какая твоя любимая книга?", "What is your favorite book?"),
    #     ("Какая твоя любимая музыка?", "What is your favorite music?"),
    #     ("Какие фильмы ты любишь?", "What movies do you like?"),
    #     ("Ты занимаешься спортом?", "Do you do sports?"),
    #     ("Как пройти до...?", "How to get to...?"),
    #     ("Можно вашу помощь?", "Can I have your help?"),
    #     ("Могу я вам помочь?", "Can I help you?"),
    #     ("Не беспокойтесь", "Don’t worry"),
    #     ("Скорую помощь", "Call an ambulance"),
    #     ("Вызовите полицию", "Call the police"),
    #     ("Мне нужно к врачу", "I need a doctor"),
    #     ("Где ближайшая аптека?", "Where is the nearest pharmacy?"),
    #     ("Я забронировал номер", "I have a reservation"),
    #     ("Мне нужен номер на одну ночь", "I need a room for one night"),
    #     ("Сколько стоит за ночь?", "How much is per night?"),
    #     ("Вы принимаете кредитные карты?", "Do you accept credit cards?"),
    #     ("Где ближайший банкомат?", "Where is the nearest ATM?"),
    #     ("Сколько времени займёт?", "How long will it take?"),
    #     ("Это далеко?", "Is it far?"),
    #     ("Можно счет, пожалуйста?", "Can I have the bill, please?"),
    #     ("Могу я расплатиться наличными?", "Can I pay in cash?"),
    #     ("Где ближайшая станция метро?", "Where is the nearest metro station?"),
    #     ("Как доехать до центра города?", "How to get to the city center?"),
    #     ("Вы можете мне помочь?", "Can you help me?"),
    #     ("У меня есть вопрос", "I have a question"),
    #     ("Говорите громче, пожалуйста", "Speak louder, please"),
    #     ("Скажите ещё раз", "Say it again"),
    #     ("Откройте, пожалуйста", "Open, please"),
    #     ("Закройте, пожалуйста", "Close, please"),
    #     ("Войдите", "Come in"),
    #     ("Выходите", "Go out"),
    #     ("Приятного аппетита", "Enjoy your meal"),
    #     ("Сколько вам лет?", "How old are you?")]
    #
    # languageEng = 'russian'

    create_expressions(expressions, languageEng)


if __name__ == '__main__':
    folder_path = "C:/Users/pedro/StudioProjects/langum/jsons"
    filename = "db_info.json"
    # Get the hostname
    hostname = socket.gethostname()
    # Get the IP address
    ip_address = socket.gethostbyname(hostname)

    print("Hostname:", hostname)
    print("IP:", ip_address)

    port = input("select PORT NUMBER - press enter for default 8888\n")
    if port == "":
        port = 8888

    db_ip_port = f"{ip_address}:{port}"
    db_info = {"ip": ip_address, "port": port}

    save_json_file(filename, db_info, folder_path)

    print("db ip port were saved to:")
    print(f"{folder_path}{filename}")

    app.run(host=ip_address, port=port)

# insert_expressions_console()

# generate_all_language_sounds('portuguese')

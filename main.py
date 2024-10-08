import os
import socket
import sqlite3
from datetime import datetime
import shared.constants

from flask import request, abort, send_from_directory, jsonify, Flask
from flask_cors import CORS

import database_api
from console_inputs import create_all_from_topic, create_all_from_topic_and_meaning_list
from shared.json_utils import save_json_file

# from sound.sound_generation import generate_all_language_sounds

database_file_path = shared.constants.DATABASE_FILE_PATH

app = Flask(__name__)
CORS(app)


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

    packs = database_api.get_language_packs(target_language_id, base_language_id)
    return jsonify(packs)


@app.route('/list_evaluations', methods=['GET'])
def get_evaluations_endpoint():
    """
        ASSUMES that evaluations with same target and base language
        :return: a list of all the evaluations
    """
    conn = sqlite3.connect(database_file_path)
    cursor = conn.cursor()

    # Query to fetch all evaluations
    query_all_evaluations = '''
    SELECT E.id    AS eval_id,
           E.start AS eval_start,
           E.end   AS eval_end,
           E.goal  AS eval_goal,
           E.type  AS eval_type,
           E.size  AS eval_size
    FROM Evaluations E
    '''
    cursor.execute(query_all_evaluations)
    evaluations = cursor.fetchall()

    # If no evaluations found, return an empty list
    if not evaluations:
        return jsonify([])

    # List to hold all evaluation data
    evaluations_list = []

    for evaluation in evaluations:
        eval_id, eval_start, eval_end, eval_goal, eval_type, eval_size = evaluation

        # Query to fetch associated evaluation expressions for each evaluation
        query_evaluation_expression = '''
        SELECT
            EE.expression_id AS expression_id,
            EE.duration  AS evaluation_duration,
            EE.grade AS evaluation_grade,
            EE.language_skill AS language_skill
        FROM EvaluationExpression EE WHERE evaluation_id = :evaluation_id
        '''

        # Fetch the associated evaluation expressions
        params = {'evaluation_id': eval_id}
        cursor.execute(query_evaluation_expression, params)
        evaluation_expressions = cursor.fetchall()

        # Convert evaluation expressions to a list of dictionaries
        evaluation_expressions_list = []
        for expression in evaluation_expressions:
            expression_id, evaluation_duration, evaluation_grade, language_skill = expression
            evaluation_expressions_list.append({
                'expression_id': expression_id,
                'grade': evaluation_grade,
                'language_skill': language_skill,
                'duration': evaluation_duration
            })

        # Combine evaluation details with its expressions
        evaluation_data = {
            'id': eval_id,
            'type': eval_type,
            'goal': eval_goal,
            'start': eval_start,
            'end': eval_end,
            'size': eval_size,
            'evaluation_expressions': evaluation_expressions_list
        }

        # Append the evaluation data to the list
        evaluations_list.append(evaluation_data)

    return jsonify(evaluations_list)


@app.route('/list_evaluation_expression', methods=['GET'])
def get_evaluation_expression():
    evaluation_expressions = database_api.get_all_evaluation_expressions()
    return jsonify(evaluation_expressions)


# TODO hardcoded lang detect
@app.route('/download_sound', methods=['GET'])
def download_file():
    filename = request.args.get('filename')
    filename_mp3 = f"{filename}.mp3"
    if filename[0] == "p":
        letters2 = "pl"
    else:
        letters2 = "pt"
    if not filename:
        abort(400, description="Filename parameter is missing.")

    file_path = f"{shared.constants.SOUND_FILES_DIRECTORY}/{letters2}"

    # Check if the file exists
    if not os.path.exists(os.path.join(file_path, filename_mp3)):
        abort(404, description="File not found.")

    return send_from_directory(file_path, filename_mp3, as_attachment=True)


@app.route('/create_evaluation', methods=['POST'])
def add_evaluation():
    data = request.get_json()

    # Extract data from the JSON request
    type_ = data.get('type')
    goal = data.get('goal')

    start_str: str = data.get('start')
    if "." in start_str:
        seconds_precision_start = start_str.split('.')[0]
    else:
        seconds_precision_start = start_str
    start = datetime.strptime(seconds_precision_start, '%Y-%m-%dT%H:%M:%S')

    end_str: str = data.get('end')
    if end_str is None:
        end = start
    else:
        if "." in end_str:
            seconds_precision_end = end_str.split('.')[0]
        else:
            seconds_precision_end = end_str
        end = datetime.strptime(seconds_precision_end, '%Y-%m-%dT%H:%M:%S')

    expressions = data.get('evaluation_expressions', [])

    # Validate data
    if not type_ or not goal or not start or not end or not expressions:
        return jsonify({'error': 'Missing required fields'}), 400

    conn = sqlite3.connect(database_file_path)
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
            language_skill = expr.get('language_skill')
            duration = expr.get('duration')

            if expression_id is None or grade is None or duration is None:
                conn.rollback()
                return jsonify({'error': 'Missing fields in expressions'}), 400

            cursor.execute('''
                INSERT INTO EvaluationExpression (expression_id, evaluation_id, grade, language_skill, duration)
                VALUES (?, ?, ?, ?, ?)
            ''', (expression_id, evaluation_id, grade, language_skill, duration))

        conn.commit()
        return jsonify({'message': 'Evaluation added successfully'}), 201

    except sqlite3.Error as e:
        conn.rollback()
        return jsonify({'error': str(e)}), 500

    finally:
        conn.close()


@app.route('/create_phonetic', methods=['POST'])
def create_phonetic():
    data = request.json
    language_id = data.get('languageId')
    expression_id = data.get('expressionId')
    text = data.get('text')

    if not all([language_id, expression_id, text]):
        return jsonify({'error': 'Missing data'}), 400

    try:
        conn = sqlite3.connect(database_file_path)
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
        conn = sqlite3.connect(database_file_path)
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


@app.route('/evaluation/<int:evaluation_id>', methods=['GET'])
def get_evaluation(evaluation_id):
    conn = sqlite3.connect(database_file_path)
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

    query_evaluation_expression = '''SELECT
       EE.expression_id AS expression_id,
       EE.duration  AS evaluation_duration,
       EE.grade AS evaluation_grade,
       EE.language_skill AS language_skill
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
        expression_id, evaluation_duration, evaluation_grade, language_skill = expression
        evaluation_expressions_list.append({
            'expression_id': expression_id,
            'grade': evaluation_grade,
            'language_skill': language_skill,
            'duration': evaluation_duration
        })

    # Combine both into a single response
    response = {
        'id': eval_id,
        'type': eval_type,
        'goal': eval_goal,
        'start': eval_start,
        'end': eval_end,
        'size': eval_size,
        'evaluation_expressions': evaluation_expressions_list
    }

    return jsonify(response)


def run_flask_server():
    filename_no_extension = shared.constants.FILENAME_NO_EXTENSION
    folder_path = shared.constants.TARGET_FOLDER_PATH_DB_INFO
    default_port_number = shared.constants.DEFAULT_PORT_NUMBER

    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)

    print("Hostname:", hostname)
    print("IP:", ip_address)

    port = input("select PORT NUMBER - press enter for default 8888\n")
    if port == "":
        port = default_port_number

    db_info = {"ip": ip_address, "port": port}

    save_json_file(db_info, filename_no_extension, folder_path, root_folder_path="")

    print("db ip port were saved to:")
    print(f"{folder_path}{filename_no_extension}.json")

    app.run(host=ip_address, port=port)


if __name__ == '__main__':
    run_flask_server()
    # create_all_from_topic("nouns plurals (nominik case)", "words", 20, "polish", "portuguese")
    # create_all_from_topic_and_meaning_list("numbers 1 to 20", [
    #     "one", "two", "three", "four", "five", "six", "seven",
    #     "eight", "nine", "ten", "eleven", "twelve", "thirteen",
    #     "fourteen", "fifteen", "sixteen", "seventeen",
    #     "eighteen", "nineteen", "twenty"
    # ], "polish", "portuguese")

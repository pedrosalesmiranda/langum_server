import sqlite3

import shared.constants
from shared.string_utils import remove_special_characters
from phonetic_scripts.ipa_phonetics import ipa_to_portuguese_phonetic_gpt_o3

database_file_path = shared.constants.DATABASE_FILE_PATH


def get_all_evaluation_expressions():
    conn = sqlite3.connect(database_file_path)
    cursor = conn.cursor()

    query_language = '''
SELECT EE.id                AS id,
       EE.expression_id     AS expression_id,
       EE.evaluation_id     AS evaluation_id,
       EE.grade             AS grade,
       EE.duration          AS duration,
       EE.language_skill    AS language_skill,
       EE.created_at        AS timestamp

FROM EvaluationExpression EE'''

    cursor.execute(query_language)

    res_evaluation_expression = cursor.fetchall()
    conn.close()

    evaluation_expressions_list = []

    for row in res_evaluation_expression:
        id, expression_id, evaluation_id, grade, duration, type_, timestamp = row
        evaluation_expressions_list.append({"id": id, "expression_id": expression_id, "evaluation_id": evaluation_id, "grade": grade, "duration": duration, "type": type_, "timestamp": timestamp})

    return evaluation_expressions_list

# TODO this method might be refactored complex logic nested objects maybe better way, break in small parts and check maybe multiple queries to DB
def get_language_packs(target_language_id, base_language_id):
    """
    return expressions grouped per pack for a given language with base language needed fields too
    :param target_language_id:
    :param base_language_id:
    :return:
    """
    conn = sqlite3.connect(database_file_path)
    cursor = conn.cursor()

    query_language = '''WITH filtered_evaluations AS (SELECT EE.*,
                                      ROW_NUMBER() OVER (
                                          PARTITION BY EE.expression_id, EE.language_skill
                                          ORDER BY EE.id DESC
                                          ) AS rn
                               FROM main.EvaluationExpression EE),
      ranked_evaluations AS (SELECT PM.pack_id        AS pack_id,
                                    E.text            AS expression_text,
                                    E.sound_filename  AS expression_sound,
                                    E.language_id     AS language_id,
                                    P.text            AS expression_phonetic,
                                    M.id              AS meaning_id,
                                    LPWT.title        AS pack_title,
                                    E.id              AS expression_id,
                                    P.id              AS phonetic_id,
                                    FE.grade          AS grade,
                                    FE.language_skill AS language_skill,
                                    FE.created_at     AS created_at,
                                    FE.id             AS expressionEvaluation_id,
                                    FE.duration       AS duration,
                                    FE.rn             AS rn
                             FROM Meanings M
                                      JOIN Expressions E ON M.id = E.meaning_id
                                      JOIN Languages L ON E.language_id = L.id
                                      JOIN MeaningPack PM ON PM.meaning_id = M.id
                                      LEFT JOIN Phonetics P ON E.id = P.expression_id
                                      LEFT JOIN LanguagePackWithTitle LPWT on PM.pack_id = LPWT.pack_id
                                      LEFT JOIN filtered_evaluations FE on E.id = FE.expression_id AND FE.rn <= 3
                             WHERE L.id IN (:target_language_id, :base_language_id)
                               AND LPWT.language_id = :base_language_id)
 SELECT *
 FROM ranked_evaluations
 ORDER BY pack_id, expression_id, language_skill, expressionEvaluation_id;'''

    # query_language = '''
    #                  SELECT PM.pack_id        AS pack_id,
    #                         E.text            AS expression_text,
    #                         E.sound_filename  AS expression_sound,
    #                         E.language_id     AS language_id,
    #                         P.text            AS expression_phonetic,
    #                         M.id              AS meaning_id,
    #                         LPWT.title        AS pack_title,
    #                         E.id              AS expression_id,
    #                         P.id              AS phonetic_id,
    #                         EE.grade          AS grade,
    #                         EE.language_skill AS language_skill,
    #                         EE.created_at     AS created_at,
    #                         EE.id             AS expressionEvaluation_id,
    #                         EE.duration       AS duration
    #
    #                  FROM Meanings M
    #                           JOIN Expressions E ON M.id = E.meaning_id
    #                           JOIN Languages L ON E.language_id = L.id
    #                           JOIN MeaningPack PM ON PM.meaning_id = M.id
    #                           LEFT JOIN Phonetics P ON E.id = P.expression_id
    #                           LEFT JOIN LanguagePackWithTitle LPWT on PM.pack_id = LPWT.pack_id
    #                           LEFT JOIN main.EvaluationExpression EE on E.id = EE.expression_id
    #                  WHERE L.id IN (:target_language_id, :base_language_id)
    #                    AND LPWT.language_id = :base_language_id
    #                  ORDER BY PM.id,
    #                           E.id,
    #                           EE.created_at DESC;
    #                  '''

    params = {
        'target_language_id': target_language_id,
        'base_language_id': base_language_id
    }
    cursor.execute(query_language, params)

    res_expressions = cursor.fetchall()
    conn.close()

    # Organize data into a dictionary by packId
    map_pack_id_to_pack = {}
    map_expression_id_to_expression_evaluations = {}
    expressions_key = "expressions"
    expression_evaluations_key = "expression_evaluations"

    for row in res_expressions:
        (pack_id, expression_text, expression_sound, language_id, expression_phonetic, meaning_id, pack_title, expression_id,
         phonetic_id, grade,language_skill, created_at, expression_evaluation_id, duration, rn)  = row
        if pack_id not in map_pack_id_to_pack:
            map_pack_id_to_pack[pack_id] = {"pack_id": pack_id, "pack_title": pack_title}

        if expressions_key not in map_pack_id_to_pack[pack_id]:
            map_pack_id_to_pack[pack_id][expressions_key] = {}

        if meaning_id not in map_pack_id_to_pack[pack_id][expressions_key]:
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id] = {}

        if language_id == target_language_id:
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["expression_text"] = expression_text
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["expression_sound"] = expression_sound
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["language_id"] = language_id
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["expression_phonetic"] = expression_phonetic
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["phonetic_id"] = phonetic_id
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["meaning_id"] = meaning_id
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["expression_id"] = expression_id

            if expression_evaluation_id is not None:
                if expression_id not in map_expression_id_to_expression_evaluations:
                    map_expression_id_to_expression_evaluations[expression_id] = {}

                if expression_evaluation_id not in map_expression_id_to_expression_evaluations[expression_id]:
                    map_expression_id_to_expression_evaluations[expression_id][expression_evaluation_id] = {
                    "id": expression_evaluation_id,
                    "grade": grade,
                    "created_at": created_at,
                    "language_skill": language_skill,
                    "duration": duration
                    }


        if language_id == base_language_id:
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["expression_base_text"] = expression_text
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["expression_base_sound"] = expression_sound
            map_pack_id_to_pack[pack_id][expressions_key][meaning_id]["language_base_id"] = language_id


    packs_list = []
    for pack_key, pack_value in map_pack_id_to_pack.items():
        expressions_list = list(pack_value[expressions_key].values())
        for expression in expressions_list:
            print(expression["expression_id"])
            current_expression_id = expression["expression_id"]
            if current_expression_id in map_expression_id_to_expression_evaluations:
                expression[expression_evaluations_key] = list(map_expression_id_to_expression_evaluations[current_expression_id].values())
            else:
                expression[expression_evaluations_key] = None


        packs_list.append({"pack_id": pack_value["pack_id"], "pack_title": pack_value["pack_title"],
                           expressions_key: expressions_list})

    return packs_list

def create_pack_meanings(description_eng: str, meanings_eng: list):
    connection = sqlite3.connect(database_file_path)
    cursor = connection.cursor()

    # Get or create pack
    cursor.execute("SELECT id FROM Packs WHERE descriptionEng = ?", (description_eng,))
    pack_row = cursor.fetchone()

    if pack_row:
        pack_id = pack_row[0]
        print(f"Pack with description '{description_eng}' already exists with id {pack_id}.")
    else:
        cursor.execute("INSERT INTO Packs (descriptionEng) VALUES (?)", (description_eng,))
        pack_id = cursor.lastrowid
        print(f"Created new pack with description '{description_eng}' and id {pack_id}.")

    # Get or create meanings
    for meaning_eng in meanings_eng:
        cursor.execute("SELECT id FROM Meanings WHERE meaningEng = ?", (meaning_eng,))
        meaning_row = cursor.fetchone()

        if meaning_row:
            meaning_id = meaning_row[0]
            print(f"Meaning '{meaning_eng}' already exists with id {meaning_id}.")
        else:
            cursor.execute("INSERT INTO Meanings (meaningEng) VALUES (?)", (meaning_eng,))
            meaning_id = cursor.lastrowid
            print(f"Created new meaning '{meaning_eng}' with id {meaning_id}.")

        # Create MeaningPack if not exists
        cursor.execute("SELECT id FROM MeaningPack WHERE pack_id = ? AND meaning_id = ?", (pack_id, meaning_id))
        pack_meaning_row = cursor.fetchone()

        if pack_meaning_row:
            print(f"PackMeaning already exists for pack_id {pack_id} and meaning_id {meaning_id}.")
        else:
            cursor.execute("INSERT INTO MeaningPack (pack_id, meaning_id) VALUES (?, ?)", (pack_id, meaning_id))
            print(f"Created new PackMeaning for pack_id {pack_id} and meaning_id {meaning_id}.")

    # Commit the transaction and close the connection
    connection.commit()
    connection.close()

def create_expressions(meanings_expressions: dict, language_eng: str):
    try:
        # Connect to the SQLite database
        conn = sqlite3.connect(database_file_path)
        cursor = conn.cursor()

        # Check if the languageEng exists in the Languages table
        cursor.execute("SELECT id FROM Languages WHERE languageEng = ?", (language_eng,))
        language_row = cursor.fetchone()

        if language_row is None:
            raise ValueError(f"Language '{language_eng}' does not exist.")

        language_id = language_row[0]

        for meaning_expression in meanings_expressions:
            meaning_eng = meaning_expression["meaningEng"]
            expression_text = meaning_expression["expression"]

            cursor.execute("SELECT id FROM Meanings WHERE meaningEng = ?", (meaning_eng,))
            meaning_row = cursor.fetchone()
            if meaning_row is None:
                # Insert the new meaningEng into the Meanings table
                cursor.execute("INSERT INTO Meanings (meaningEng) VALUES (?)", (meaning_eng,))
                conn.commit()
                meaning_id = cursor.lastrowid
            else:
                meaning_id = meaning_row[0]

            cursor.execute("SELECT id FROM Expressions WHERE text = ?", (expression_text,))
            expression_row = cursor.fetchone()
            if expression_row is not None:
                print(f"Expression text '{expression_text}' already exists.")
                continue

            # Generate the sound_filename
            sound_filename = f"{language_eng.lower()}__{remove_special_characters(meaning_eng.lower().replace(' ', '_'))}"

            # Insert the new expression into the Expressions table
            cursor.execute('''
                INSERT INTO Expressions (text, sound_filename, language_id, meaning_id)
                VALUES (?, ?, ?, ?)
            ''', (expression_text, sound_filename, language_id, meaning_id))

        # Commit the transaction
        conn.commit()

        print("Expressions created successfully.")

        # Close the connection
        cursor.close()
        conn.close()

    except sqlite3.Error as e:
        print(f"Error: {e}")

# def create_phonetics(expressions_phonetics: dict, base_language: str):
#     pass

def create_phonetics(expressions_phonetics: dict, base_language: str):
    conn = sqlite3.connect(database_file_path)
    cursor = conn.cursor()

    # Get base language ID
    cursor.execute("SELECT id FROM Languages WHERE languageEng = ?", (base_language,))
    base_language_id = cursor.fetchone()
    if base_language_id is None:
        print(f"Language '{base_language}' not found.")
        conn.close()
        return
    base_language_id = base_language_id[0]

    for expression_phonetic in expressions_phonetics:
        expression_text = expression_phonetic['expression']
        phonetic_text = expression_phonetic['phonetic_text']

        # TODO IPA TO PT PHONETIC this might be refactored and create another field in database
        phonetic_text = ipa_to_portuguese_phonetic_gpt_o3(phonetic_text)

        # Find expression_id
        cursor.execute("SELECT id FROM Expressions WHERE text = ?", (expression_text,))
        expression_id = cursor.fetchone()
        if expression_id is None:
            print(f"Expression '{expression_text}' not found.")
            continue
        expression_id = expression_id[0]

        # Check if phonetic already exists
        cursor.execute("""
            SELECT id FROM Phonetics
            WHERE expression_id = ?
        """, (expression_id,))
        phonetic_id = cursor.fetchone()

        if phonetic_id:
            # Update existing phonetic
            cursor.execute("""
                UPDATE Phonetics
                SET text = ?
                WHERE id = ?
            """, (phonetic_text, phonetic_id[0]))
        else:
            # Create new phonetic
            cursor.execute("""
                INSERT INTO Phonetics (text, expression_id)
                VALUES (?, ?)
            """, (phonetic_text, expression_id))

    conn.commit()
    conn.close()

def create_language_pack_title(language_id: int, pack_id: int, title: str):
    conn = sqlite3.connect(database_file_path)
    cursor = conn.cursor()

    # Check if language pack title already exists
    cursor.execute("""
        SELECT id FROM LanguagePackWithTitle
        WHERE pack_id = ? AND language_id = ?
    """, (pack_id, language_id))
    existing_title_id = cursor.fetchone()

    if existing_title_id:
        # Update existing title
        cursor.execute("""
            UPDATE LanguagePackWithTitle
            SET title = ?
            WHERE id = ?
        """, (title, existing_title_id[0]))
        print(f"Updated language pack title for pack_id {pack_id} and language_id {language_id}.")
    else:
        # Create new title
        cursor.execute("""
            INSERT INTO LanguagePackWithTitle (pack_id, language_id, title)
            VALUES (?, ?, ?)
        """, (pack_id, language_id, title))
        print(f"Created new language pack title '{title}' for pack_id {pack_id} and language_id {language_id}.")

    conn.commit()
    conn.close()

def copyDescriptionEngToLanguagePackTitle(language: str):
    conn = sqlite3.connect(database_file_path)
    cursor = conn.cursor()

    # Get language_id from language string
    cursor.execute("SELECT id FROM Languages WHERE languageEng = ?", (language,))
    language_row = cursor.fetchone()
    
    if language_row is None:
        print(f"Language '{language}' not found in database.")
        conn.close()
        return
    
    language_id = language_row[0]

    # Find packs that don't have titles for the specified language_id
    cursor.execute("""
        SELECT p.id, p.descriptionEng
        FROM Packs p
        WHERE p.id NOT IN (
            SELECT lpwt.pack_id 
            FROM LanguagePackWithTitle lpwt 
            WHERE lpwt.language_id = ?
        )
    """, (language_id,))
    
    missing_packs = cursor.fetchall()
    
    if not missing_packs:
        print(f"All packs already have titles for language '{language}' (id: {language_id}).")
        conn.close()
        return
    
    print(f"Found {len(missing_packs)} packs missing titles for language '{language}' (id: {language_id}).")
    
    # Insert missing pack titles
    for pack_id, description_eng in missing_packs:
        cursor.execute("""
            INSERT INTO LanguagePackWithTitle (pack_id, language_id, title)
            VALUES (?, ?, ?)
        """, (pack_id, language_id, description_eng))
        print(f"Created language pack title '{description_eng}' for pack_id {pack_id} and language_id {language_id}.")
    
    conn.commit()
    conn.close()
    print(f"Successfully copied {len(missing_packs)} pack descriptions to LanguagePackWithTitle.")

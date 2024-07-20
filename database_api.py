import sqlite3

import shared.constants
from shared.string_utils import remove_special_characters

database_file_path = shared.constants.DATABASE_FILE_PATH


def get_language_packs(target_language_id, base_language_id):
    """
    return expressions grouped per pack for a given language with base language needed fields too
    :param target_language_id:
    :param base_language_id:
    :return:
    """
    conn = sqlite3.connect(database_file_path)
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

        # Create PackMeaning if not exists
        cursor.execute("SELECT id FROM PackMeaning WHERE pack_id = ? AND meaning_id = ?", (pack_id, meaning_id))
        pack_meaning_row = cursor.fetchone()

        if pack_meaning_row:
            print(f"PackMeaning already exists for pack_id {pack_id} and meaning_id {meaning_id}.")
        else:
            cursor.execute("INSERT INTO PackMeaning (pack_id, meaning_id) VALUES (?, ?)", (pack_id, meaning_id))
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
            WHERE language_id = ? AND expression_id = ?
        """, (base_language_id, expression_id))
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
                INSERT INTO Phonetics (text, language_id, expression_id)
                VALUES (?, ?, ?)
            """, (phonetic_text, base_language_id, expression_id))

    conn.commit()
    conn.close()

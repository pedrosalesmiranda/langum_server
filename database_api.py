import sqlite3

import shared.constants
from shared.string_utils import remove_special_characters

database_file_path = shared.constants.DATABASE_FILE_PATH


# def create_pack_meanings(description_eng: str, meanings_eng: list):
#     # get pack_id
#     # check if description is in Packs if not create a pack, if pack exists print a message
#
#     # for each meaning check get meaning_id
#     # check if meaning is in Meanings if not create a meaning, if pack exists print a message
#     # if pack or meaning was create create a PackMeaning
#     pass


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
        conn = sqlite3.connect(database_file_path)
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

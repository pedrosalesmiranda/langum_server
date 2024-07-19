import sqlite3

from gtts import gTTS

import shared.constants
from shared.file_utils import file_exists, create_folder_if_not_exists


def generateSoundExpression(expression: str, sound_filename: str, lang_2_letters: str):
    sound_folder_path = shared.constants.SOUND_FILES_DIRECTORY
    file_path = f"{sound_folder_path}/{lang_2_letters}/{sound_filename.lower()}.mp3"
    if file_exists(file_path):
        return
    tts = gTTS(expression.lower(), lang=lang_2_letters)
    tts.save(file_path)

def generate_all_language_sounds(langEng: str):
    conn = sqlite3.connect('database/langum.db')
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

    def get_language_packs(target_language_id, base_language_id):
        """
        return expressions grouped per pack for a given language with base language needed fields too
        :param target_language_id:
        :param base_language_id:
        :return:
        """
        conn = sqlite3.connect('database/langum.db')  # Replace 'your_database.db' with your actual database file
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
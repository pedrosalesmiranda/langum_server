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
    create_folder_if_not_exists(f"{shared.constants.SOUND_FILES_DIRECTORY}/{lang_2_letters}")

    # Generate sound for each expression
    for expression, sound_filename in expressions:
        generateSoundExpression(expression, sound_filename, lang_2_letters)
        print(f"{sound_filename} was created in {lang_2_letters}")

    conn.close()

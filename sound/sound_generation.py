import sqlite3
import json

from gtts import gTTS

import shared.constants
from shared.constants import PROJECT_ROOT
from shared.file_utils import file_exists, create_folder_if_not_exists


def generateSoundExpression(expression: str, sound_filename: str, lang_2_letters: str):
    sound_folder_path = shared.constants.SOUND_FILES_DIRECTORY
    file_path = f"{sound_folder_path}/{lang_2_letters}/{sound_filename.lower()}.mp3"
    if file_exists(file_path):
        return
    tts = gTTS(expression.lower(), lang=lang_2_letters)
    tts.save(file_path)

def generate_all_language_sounds(langEng: str):
    conn = sqlite3.connect(f'{PROJECT_ROOT}/database/langum.db')
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


def generate_verb_sounds():
    verbs_json_path = f"{PROJECT_ROOT}/sound/verbs.json"
    verb_sounds_folder = f"{PROJECT_ROOT}/verb_sounds"
    
    create_folder_if_not_exists(verb_sounds_folder)
    
    with open(verbs_json_path, 'r', encoding='utf-8') as file:
        verbs_data = json.load(file)
    
    for verb in verbs_data:
        meaning = verb.get("meaning", "").replace(" ", "_").replace("(", "").replace(")", "").replace(",", "")
        
        for aspect_name, aspect_data in verb.items():
            if aspect_name == "meaning":
                continue
                
            for tense_name, tense_data in aspect_data.items():
                if isinstance(tense_data, dict):
                    if "form" in tense_data:
                        verb_form = tense_data["form"]
                        filename = f"russian_verb_{aspect_name}_{tense_name}_{meaning}"
                        file_path = f"{verb_sounds_folder}/{filename}.mp3"
                        
                        if not file_exists(file_path):
                            try:
                                tts = gTTS(verb_form.lower(), lang="ru")
                                tts.save(file_path)
                                print(f"Generated: {filename}.mp3")
                            except Exception as e:
                                print(f"Error generating {filename}.mp3: {e}")
                    
                    for person_name, person_data in tense_data.items():
                        if isinstance(person_data, dict) and "form" in person_data:
                            verb_form = person_data["form"]
                            filename = f"russian_verb_{aspect_name}_{tense_name}_{person_name}_{meaning}"
                            file_path = f"{verb_sounds_folder}/{filename}.mp3"
                            
                            if not file_exists(file_path):
                                try:
                                    tts = gTTS(verb_form.lower(), lang="ru")
                                    tts.save(file_path)
                                    print(f"Generated: {filename}.mp3")
                                except Exception as e:
                                    print(f"Error generating {filename}.mp3: {e}")


# generate_all_language_sounds("portuguese")
# text = "ola tudo bem?"

# Brazil accent
# tts = gTTS(text.lower(), lang="pt", tld='com.br')
# Portugal accent
# tts = gTTS(text.lower(), lang="pt", tld='pt')

# tts.save("./sound.mp3")

generate_verb_sounds()
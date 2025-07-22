import json
import shared.json_utils
import shared.file_utils
import shared.constants
from database_api import create_phonetics, create_expressions, create_pack_meanings
from expressions_generation_scripts.gpt_prompts.prompt_generation import generate_pack_meanings_prompt, \
    generate_expressions_prompt, generate_phonetics_prompt
from shared.string_utils import copy_to_clipboard, paste_from_clipboard
from sound.sound_generation import generate_all_language_sounds


def create_all_from_topic(topic: str, expression_type: str, num_expressions: int, target_lang: str, base_lang):
    input_folder_path = shared.constants.JSON_INPUT_FOLDER_PATH
    res = generate_pack_meanings_prompt(topic, expression_type, num_expressions)
    copy_to_clipboard(res)
    input("please PASTE in GPT, COPY result (meanings.json). And then *** PRESS any key to continue ***")
    data = json.loads(paste_from_clipboard())
    shared.json_utils.save_json_file(data, shared.constants.PACK_MEANINGS_JSON_FILENAME_NO_EXTENSION,
                                     folder_path=input_folder_path)
    print(data)

    expressions = _generate_and_save_expressions(data["meanings"], target_lang, base_lang)
    if not expressions:
        return

    _generate_and_save_phonetics(expressions, target_lang, base_lang)
    _create_database_entries(base_lang)
    _generate_language_sounds(target_lang, base_lang)


def create_all_from_json_meanings(target_lang: str, base_lang):
    input_folder_path = shared.constants.JSON_INPUT_FOLDER_PATH
    meanings_data = shared.json_utils.load_json_file(shared.constants.PACK_MEANINGS_JSON_FILENAME_NO_EXTENSION,
                                                     folder_path=input_folder_path)

    shared.json_utils.save_json_file(meanings_data, shared.constants.PACK_MEANINGS_JSON_FILENAME_NO_EXTENSION,
                                     folder_path=input_folder_path)
    print("saved processed meanings")

    expressions = _generate_and_save_expressions(meanings_data["meanings"], target_lang, base_lang)
    if not expressions:
        return

    _generate_and_save_phonetics(expressions, target_lang, base_lang)
    _create_database_entries(base_lang)
    _generate_language_sounds(target_lang, base_lang)


# TODO create also LanguagePackWithTile row pack title in base language
def create_pack_meanings_from_json():
    filename_no_extension = shared.constants.PACK_MEANINGS_JSON_FILENAME_NO_EXTENSION
    pack_meanings = shared.json_utils.load_json_file(filename_no_extension,
                                                     folder_path=shared.constants.JSON_INPUT_FOLDER_PATH)
    create_pack_meanings(pack_meanings["pack"], pack_meanings["meanings"])
    _save_processed(pack_meanings, filename_no_extension, pack_meanings["pack"])


def create_expressions_from_json():
    filename_no_extension = shared.constants.EXPRESSIONS_JSON_FILENAME_NO_EXTENSION
    expressions = shared.json_utils.load_json_file(filename_no_extension,
                                                   folder_path=shared.constants.JSON_INPUT_FOLDER_PATH)
    if expressions is map:
        create_expressions(expressions["meanings_expressions"], expressions["language"])
    else:
        for exp in expressions:
            create_expressions(exp["meanings_expressions"], exp["language"])

    _save_processed(expressions, filename_no_extension)


def create_phonetics_from_json(language_eng: str):
    filename_no_extension = shared.constants.PHONETICS_JSON_FILENAME_NO_EXTENSION
    phonetics = shared.json_utils.load_json_file(filename_no_extension,
                                                 folder_path=shared.constants.JSON_INPUT_FOLDER_PATH)
    create_phonetics(phonetics, language_eng)
    _save_processed(phonetics, filename_no_extension)


def _generate_and_save_expressions(meanings: list, target_lang: str, base_lang: str) -> list:
    input_folder_path = shared.constants.JSON_INPUT_FOLDER_PATH
    res = generate_expressions_prompt(meanings, target_lang, base_lang)
    copy_to_clipboard(res)
    input("please PASTE in GPT, COPY result (expressions.json). And then *** PRESS any key to continue ***")
    data = json.loads(paste_from_clipboard())
    shared.json_utils.save_json_file(data, shared.constants.EXPRESSIONS_JSON_FILENAME_NO_EXTENSION,
                                     folder_path=input_folder_path)
    print(data)
    meanings_expressions = []
    for meaning_expression_dict in data:
        if meaning_expression_dict["language"] == target_lang:
            meanings_expressions = meaning_expression_dict["meanings_expressions"]
            break
    if len(meanings_expressions) == 0:
        print(f"meaning_expressions not found for {target_lang}")
        return []
    return meanings_expressions


def _generate_and_save_phonetics(expressions: list, target_lang: str, base_lang: str):
    input_folder_path = shared.constants.JSON_INPUT_FOLDER_PATH
    res = generate_phonetics_prompt([item['expression'] for item in expressions], target_lang, base_lang)
    copy_to_clipboard(res)
    input("please PASTE in GPT, COPY result (phonetics.json). And then *** PRESS any key to continue ***")
    data = json.loads(paste_from_clipboard())
    shared.json_utils.save_json_file(data, shared.constants.PHONETICS_JSON_FILENAME_NO_EXTENSION,
                                     folder_path=input_folder_path)
    print(data)


def _create_database_entries(base_lang: str):
    create_pack_meanings_from_json()
    create_expressions_from_json()
    create_phonetics_from_json(base_lang)


def _generate_language_sounds(target_lang: str, base_lang: str):
    generate_all_language_sounds(target_lang)
    generate_all_language_sounds(base_lang)


def _save_processed(content: dict, filename_no_extension: str, title: str = ""):
    timestamp = shared.file_utils.get_timestamp()
    filename = f"{timestamp}_{filename_no_extension}_{title}"
    shared.json_utils.save_json_file(content, filename,
                                     f"{shared.constants.JSON_INPUT_FOLDER_PATH}/processed")

# generate_all_language_sounds("english")

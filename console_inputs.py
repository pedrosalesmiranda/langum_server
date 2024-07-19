from database_api import create_phonetics, create_expressions, create_pack_meanings
import shared.json_utils
import shared.file_utils
import shared.constants


def create_pack_meanings_from_json():
    filename_no_extension = shared.constants.PACK_MEANINGS_JSON_FILENAME_NO_EXTENSION
    pack_meanings = shared.json_utils.load_json_file(filename_no_extension, folder_path="inputs")
    create_pack_meanings(pack_meanings["pack"], pack_meanings["meanings"])
    _save_processed(pack_meanings, filename_no_extension)


def create_expressions_from_json():
    filename_no_extension = shared.constants.EXPRESSIONS_JSON_FILENAME_NO_EXTENSION
    expressions = shared.json_utils.load_json_file(filename_no_extension, folder_path="inputs")
    create_expressions(expressions["meanings_expressions"], expressions["language"])
    _save_processed(expressions, filename_no_extension)


def create_phonetics_from_json():
    filename_no_extension = shared.constants.PHONETICS_JSON_FILENAME_NO_EXTENSION
    phonetics = shared.json_utils.load_json_file(filename_no_extension, folder_path="inputs")
    create_phonetics(phonetics, "portuguese")
    _save_processed(phonetics, filename_no_extension)


def _save_processed(content: dict, filename_no_extension: str):
    timestamp = shared.file_utils.get_timestamp()
    shared.json_utils.save_json_file(content, f"{timestamp}_{filename_no_extension}", folder_path=f"inputs/processed")

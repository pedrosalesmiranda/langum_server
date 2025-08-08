import json
from shared.constants import PROJECT_ROOT

def save_json_file(json_dict: dict, filename_no_extension: str, folder_path="", indent=4, root_folder_path=PROJECT_ROOT):
    if folder_path == "":
        file_path = f"{filename_no_extension}.json"
    else:
        file_path = f"{folder_path}/{filename_no_extension}.json"

    if root_folder_path != "":
        file_path = f"{root_folder_path}/{file_path}"

    with open(file_path, "w", encoding='utf-8') as outfile:
        json.dump(json_dict, outfile, indent=indent, ensure_ascii=False)

def load_json_file(filename_no_extension: str, folder_path="", root_folder_path=PROJECT_ROOT):
    if folder_path == "":
        file_path = f"{filename_no_extension}.json"
    else:
        file_path = f"{folder_path}/{filename_no_extension}.json"

    if root_folder_path != "":
        file_path = f"{root_folder_path}/{file_path}"

    with open(file_path, 'r', encoding='utf-8') as file:
        data = json.load(file)
    return data


def load_json_file_from_path(file_path: str):
    """Load JSON file from absolute or relative path"""
    with open(file_path, 'r', encoding='utf-8') as file:
        data = json.load(file)
    return data

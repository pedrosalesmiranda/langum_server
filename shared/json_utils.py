import json


def save_json_file(json_dict: dict, filename_no_extension: str, folder_path="", indent=4, root_folder_path='jsons'):
    if folder_path == "":
        file_path = f"{filename_no_extension}.json"
    else:
        file_path = f"{folder_path}/{filename_no_extension}.json"

    if root_folder_path != "":
        file_path = f"{root_folder_path}/{file_path}"

    with open(file_path, "w", encoding='utf-8') as outfile:
        json.dump(json_dict, outfile, indent=indent, ensure_ascii=False)

def load_json_file(filename_no_extension: str, folder_path=""):
    if folder_path == "":
        file_path = f"jsons/{filename_no_extension}.json"
    else:
        file_path = f"jsons/{folder_path}/{filename_no_extension}.json"
    with open(file_path, 'r', encoding='utf-8') as file:
        data = json.load(file)
    return data

import json


def save_json_file(filename: str, json_dict: dict, folder_path="", indent=4):
    with open(f"{folder_path}/{filename}", "w") as outfile:
        json.dump(json_dict, outfile, indent=indent)

def load_json_file(filename: str):
    with open(f"jsons/inputs/{filename}", 'r') as file:
        data = json.load(file)
    return data
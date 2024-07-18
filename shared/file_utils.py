import os


def create_folder_if_not_exists(folder_path: str):
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)


def file_exists(file_path: str):
    return os.path.isfile(file_path)
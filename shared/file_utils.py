import os
from datetime import datetime


def get_timestamp():
    return datetime.now().strftime('%Y%m%d_%H%M%S')


def create_folder_if_not_exists(folder_path: str):
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)


def file_exists(file_path: str):
    return os.path.isfile(file_path)


def get_filename_without_extension(file_path: str):
    """Get filename without extension from a file path"""
    filename = os.path.basename(file_path)
    return os.path.splitext(filename)[0]

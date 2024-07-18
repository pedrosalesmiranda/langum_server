import re


def remove_special_characters(expression):
    return re.sub(r'[^a-zA-Z0-9\s_]', '', expression)
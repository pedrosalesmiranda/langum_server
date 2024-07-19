import re
import pyperclip


def copy_to_clipboard(text):
    pyperclip.copy(text)
    print("text was copied to clipboard!")


def paste_from_clipboard():
    text = pyperclip.paste()
    return text


def remove_special_characters(expression):
    return re.sub(r'[^a-zA-Z0-9\s_]', '', expression)

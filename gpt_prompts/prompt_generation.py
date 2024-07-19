def generate_pack_meanings_prompt(topic: str, expression_type: str, num_elements: int) -> str:
    return f"""
    PACK(string) = {topic}
    NUM_ELEMENTS(int) = {num_elements}
    TYPE = {expression_type}

    output is python dictionary
    output = ("pack": PACK, "meanings": MEANINGS)
    MEANINGS(list of strings with NUM_ELEMENTS) - TYPE related to PACK
    show me only the output no explanations
    """


def generate_expressions_prompt(meanings: list, target_language: str, base_language: str) -> str:
    return f"""
MEANINGS = {meanings}
TARGET_LANGUAGE = {target_language}
BASE_LANGUAGE = {base_language}

dict_target = {{ "language": TARGET_LANGUAGE, "meanings_expressions": [{{"meaningEng": meaning, "expression": meaning in target language}}] }}
dict_base = {{ "language": BASE_LANGUAGE, "meanings_expressions": [{{"meaningEng": meaning, "expression": meaning in base language}}] }}
show me only list of dicts [dict_target, dict_base], nothing more
"""


def generate_phonetics_prompt(expressions: list, target_language: str, base_language: str) -> str:
    return f"""
EXPRESSIONS = {expressions}
TARGET_LANGUAGE = {target_language}
BASE_LANGUAGE = {base_language}

phonetic is TARGET_LANGUAGE reading of expression then split in syllabus separated by - then phonetic transcription in TARGET_BASE
{{"expression": expression from EXPRESSIONS, "phonetic_text":  phonetic }}
show me only list of dicts nothing more
"""

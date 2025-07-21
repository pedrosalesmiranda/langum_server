from __future__ import annotations
import re
import unicodedata
from typing import Dict

def russian_to_ipa(russian_text):
    """
    Convert Russian text to IPA using Epitran.
    """
    # ipa_text = epi.transliterate(russian_text)
    # return ipa_text
    pass

"""
ipa_to_portuguese_phonetic.py
=============================

A utility for converting an International Phonetic Alphabet (IPA) transcription
into an approximate Portuguese‑style phonetic spelling.

⚠️  Disclaimer
--------------
This is **an approximation** that favours readability for L2 Portuguese speakers
rather than absolute phonetic precision.  Several IPA symbols do not have exact
orthographic equivalents in Portuguese; in those cases, the closest commonly
recognised match is chosen.  You can refine or extend the mapping table as
needed for your use‑case.

Example
~~~~~~~
>>> ipa_to_portuguese_phonetic("ˈfʊt.bɔl")
'futbó'

>>> ipa_to_portuguese_phonetic("fəˈnɛ.tɪks")
'fanétiks'
"""

# ---------------------------------------------------------------------------
# Master mapping table
# ---------------------------------------------------------------------------
# Longer sequences MUST appear before their substrings to guarantee correct
# greedy matching.  We therefore build LONGEST_FIRST programmatically.
IPA_TO_PT: Dict[str, str] = {
    # PSM custom
    "ʲɪjə": "ia",
    "t͡s": "ts",
    "t͡ɕ": "tch",
    "sʲɵ": "siou",

    "ʲi": "i",
    "ʲɪ": "iei", #her book... е-ё , jɪ-ˈjo TODO check
    "ʲe": "ié",
    "ʲʊ": "iu",
    "ʲa": "iá",
    "ʲə": "ia",

    "jɪ": "ié", #her book... е-ё , jɪ-ˈjo TODO check
    "jo": "iou",
    # "vo": "vou",

    "lʲ": "l⁻", # soft l lingua mais em baixo
    "ть": "t⁻",

    "fʲ": "f", # discard soft
    "nʲ": "ni", # discard soft

    "ʨ":"tch",
    "ʂ": "ch",
    "ʐ": "j",

    "ɡ": "g",
    "k": "k",



    #BELLOW GPT generated
    
    # ‑‑‑ Multifone clusters / affricates first  ‑‑‑
    "tʃ": "tch",   # e.g. English "chocolate"
    "dʒ": "dj",    # e.g. English "judge"

    # ‑‑‑ Palato‑alveolar / postalveolar ‑‑‑
    "ʃ": "ch",      # Portuguese "ch", English "sh"
    "ʒ": "j",      # Portuguese "j" / French "je"

    # ‑‑‑ Nasals & laterals ‑‑‑
    "ɲ": "nh",     # Portuguese "nh"
    "ʎ": "lh",     # Portuguese "lh"
    "ŋ": "ng",     # English "sing"

    # ‑‑‑ Consonants ‑‑‑
    "p": "p", "b": "b", "t": "t", "d": "d", "k": "k", "g": "g",
    "m": "m", "n": "n", "f": "f", "v": "v", "s": "c", "z": "z",
    "ʁ": "r", "r": "r", "ɾ": "r", "χ": "rr", "h": "h", "l": "l", "ɫ": "l",
    "ʔ": "",  # glottal stop left blank

    # ‑‑‑ Vowels (monophthongs) ‑‑‑
    "i": "i", "ɪ": "i", "y": "iu",
    "e": "e", "e̞": "e", "ɛ": "é", "ɨ": "i",
    "ə": "a", "ɜ": "a",
    "u": "u", "ʊ": "u",
    "o": "ou", "o̞": "o", "ɔ": "ó", "ɒ": "ó",
    "a": "á", "ɐ": "a", "ɑ": "á", "æ": "é",

    # ‑‑‑ Suprasegmentals & length marks (stripped) ‑‑‑
    "ˈ": "", "ˌ": "",  # primary / secondary stress
    "ː": "", "ˑ": "",  # length marks
    "˞": "r",            # rhoticity → add 'r'
}

# Build a list sorted by descending symbol length to enable greedy matching.
LONGEST_FIRST = sorted(IPA_TO_PT.keys(), key=len, reverse=True)

# Pre‑compiled regex to compress letter repetitions that often arise when
# mapping 1‑to‑many (e.g. "rrr" → "rr").  We allow double letters at most.
COMPRESS_RE = re.compile(r"(.)\\1{2,}")


def _strip_diacritics(text: str) -> str:
    """Remove combining diacritics so that, e.g., *e̞* ⇒ *e* before lookup."""
    norm = unicodedata.normalize("NFKD", text)
    return "".join(c for c in norm if not unicodedata.combining(c))


def ipa_to_portuguese_phonetic_gpt_o3(ipa_text: str) -> str:
    """Return a Portuguese‑flavoured phonetic spelling for *ipa_text*.

    Parameters
    ----------
    ipa_text : str
        A string containing IPA symbols. Stress marks (ˈ, ˌ) are respected
        only insofar as they *remove* the marks; accent‑coding of stress is
        handled heuristically via vowel choice in the mapping table.

    Returns
    -------
    str
        A string using only basic Latin letters plus *á, é, ó, ê* to indicate
        stressed vowels where commonly used in Portuguese orthography.

    Examples
    --------
    >>> ipa_to_portuguese_phonetic("ˈteɫ.e.fon")
    'téléfon'
    """

    # 1. Canonicalise input by stripping diacritics not explicitly covered.
    # cleaned = _strip_diacritics(ipa_text)
    # PSM
    cleaned = ipa_text

    result: list[str] = []
    i = 0
    while i < len(cleaned):
        for sym in LONGEST_FIRST:
            if cleaned.startswith(sym, i):
                result.append(IPA_TO_PT[sym])
                i += len(sym)
                break
        else:  # no break ⇒ no symbol matched
            result.append(cleaned[i])  # copy raw character through
            i += 1

    # 3. Compress overly long double‑letters, e.g., "rrr" → "rr".
    spelled = COMPRESS_RE.sub(r"\\1\\1", "".join(result))

    return spelled


# ---------------------------------------------------------------------------
# Simple CLI for ad‑hoc use
# ---------------------------------------------------------------------------


def ipa_to_portuguese_phonetic(ipa_text):
    """
    Map IPA symbols to a Portuguese-like phonetic spelling.
    This is a simple example. You can expand this mapping!
    """
    ipa_pt_map = {
        'ʲet': 'iet',
        'ɪ': 'i',
        'ʐ': 'j',  # ж
        'ʂ': 'ch',  # ш
        'ɕː': 'chtch',  # щ
        'x': 'rr',  # х
        'j': 'i',   # й
        't͡s': 'ts',  # ц
        'ɨ': '#i',  # ы
        'ʲ': '',    # palatalization marker - often ignored or handled by inserting i
        'ə': 'a',   # reduced vowel
        'ɡ': 'g',  # olho gee nao g...
        'ɕ': 'sh',
        'ɐ': 'a',
        'ʎ': 'lh',
        'ʒ': 'dj'  # like in 'jorge'
        # Add more as needed!
    }

    result = ipa_text

    for ipa_symbol, pt_phonetic in ipa_pt_map.items():
        result = result.replace(ipa_symbol, pt_phonetic)

    # For clarity, remove extra IPA diacritics if needed
    result = result.replace('ˈ', '')  # primary stress
    result = result.replace('ˌ', '')  # secondary stress

    return result


if __name__ == "__main__":
    # Example usage:
    # russian_input = "молоко"  # means 'milk'
    # ipa_output = russian_to_ipa(russian_input)
    # print(f"IPA: {ipa_output}")

    portuguese_phonetic = ipa_to_portuguese_phonetic("prʲɪˈvʲet")
    print(f"Portuguese Phonetic: {portuguese_phonetic}")

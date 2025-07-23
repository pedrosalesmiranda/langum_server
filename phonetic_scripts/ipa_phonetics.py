from __future__ import annotations
import re
import unicodedata
from typing import Dict

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
    "nat͡sɨtʲ": "nátsatь",
    "ʲɪjə": "ia",
    "t͡s": "ts",
    "t͡ɕ": "tch",
    "sʲɵ": "siou",
    "ʲi": "i",
    "ʲɪ": "i",
    "ʲe": "ié",
    "ʲʊ": "iu",
    "ʲa": "iá",
    "ʲə": "ia",
    "jɪ": "ié", #her book... е-ё , jɪ-ˈjo TODO check
    "jo": "iou",
    # "vo": "vou",

    # "ть": "tь", # in what case lets comment out

    "lʲ": "lь", # soft l lingua mais em baixo
    "fʲ": "fь", # maybe discard soft
    "nʲ": "nь", # maybe discard soft
    "tʲ": "tь", # maybe discard soft

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


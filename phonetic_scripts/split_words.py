import re

# Define Russian vowels (including uppercase for completeness)
VOWELS = set("аеёиоуыэюяАЕЁИОУЫЭЮЯ")
# Define sonorant consonants (these correspond to sounds [j], [r], [l], [m], [n] and their hard/soft forms)
SONORANTS = set("йЙрРлЛмМнН")

def split_russian_word(word: str) -> str:
    """
    Split a single Russian word into syllables separated by hyphens according to
    modern phonetic rules.
    """
    # If the token is purely numeric or has fewer than 2 vowels, no syllable split is needed
    if word.isdigit() or sum(1 for ch in word if ch in VOWELS) < 2:
        return word

    # List to collect indices where we'll insert a hyphen
    break_indices = []

    # Find indices of all vowel letters in the word
    vowel_indices = [i for i, ch in enumerate(word) if ch in VOWELS]

    # Iterate through each vowel (except the last) to determine syllable boundary after it
    for idx, v_idx in enumerate(vowel_indices[:-1]):
        next_v_idx = vowel_indices[idx+1]
        # Determine the consonant sequence (if any) between this vowel and the next vowel
        cluster_start = v_idx + 1
        cluster_end = next_v_idx - 1

        # If no consonants between vowels, break right after the current vowel
        if cluster_start > cluster_end:
            break_indices.append(v_idx)
            continue

        # Extract the cluster substring of all characters between the two vowels
        cluster = word[cluster_start: cluster_end+1]

        # If the cluster is composed solely of ь/ъ signs (no actual consonant sound),
        # then keep those with the previous syllable (break after the cluster).
        if re.fullmatch(r"[ЬьЪъ]+", cluster):
            break_indices.append(cluster_end)  # break at end of these signs
            continue

        # Now process the cluster to decide exact break point.
        # We will treat 'ь', 'ъ' as part of the preceding consonant.
        # Build a list of "units": each unit is a consonant letter possibly followed by ь/ъ.
        units = []
        i = 0
        while i < len(cluster):
            char = cluster[i]
            if char in "ЬьЪъ":
                # Attach sign to the previous unit (it softens or separates the previous consonant)
                if units:
                    units[-1] += char
                # If the cluster starts with a sign (rare in proper Russian words),
                # we treat it as a standalone unit.
                else:
                    units.append(char)
                i += 1
            else:
                # Start a new unit with this consonant
                units.append(char)
                i += 1

        # If the cluster began with a sign (standalone ь/ъ unit), we break right after it
        if units and len(units[0]) == 1 and units[0] in "ЬьЪъ":
            break_indices.append(cluster_start)  # break after the sign
            continue

        # Determine the category of each unit (sonorant or noisy) based on its first letter
        unit_categories = []
        for unit in units:
            # The "base" letter is the first alphabetic char (signs at the start of unit, if any, are skipped)
            base_char = unit[0] if unit[0] not in "ЬьЪъ" else unit[1]
            unit_categories.append("sonorant" if base_char in SONORANTS else "noisy")

        # Apply special rule for 'й': if a unit starts with й and it's at the boundary,
        # keep й with the previous syllable.
        if unit_categories and units and units[0][0] in "йЙ":
            # Break after the entire first unit (which includes й)
            break_indices.append(cluster_start + len(units[0]) - 1)
            continue

        # If the first consonant unit is *noisy* and contains a ь or ъ,
        # it should not be pushed to the next syllable (to avoid illegal onset with the sign).
        if unit_categories and unit_categories[0] == "noisy" and re.search(r"[ЬьЪъ]", units[0]):
            # Break after the first unit, keeping that noisy consonant (with its sign) in the first syllable
            break_indices.append(cluster_start + len(units[0]) - 1)
            continue

        # Find the first occurrence of a sonorant followed immediately by a noisy consonant in the units
        break_after_unit = None
        for j in range(len(unit_categories) - 1):
            if unit_categories[j] == "sonorant" and unit_categories[j+1] == "noisy":
                break_after_unit = j  # break after this unit
                break

        if break_after_unit is not None:
            # Calculate the index in the original word corresponding to end of the break_after_unit
            # Sum lengths of all units up to and including break_after_unit
            pos = cluster_start + sum(len(u) for u in units[:break_after_unit+1]) - 1
            break_indices.append(pos)
        else:
            # No special sonorant-noisy pair found: default to break right after the vowel
            # (This will put the entire cluster into the next syllable)
            brk_pos = v_idx
            # If that means a ь/ъ would start the next syllable, adjust to after the sign
            if word[v_idx+1] in "ЬьЪъ":
                brk_pos = v_idx + 1
            break_indices.append(brk_pos)

    # Insert hyphens at the collected break indices
    result = []
    for i, ch in enumerate(word):
        result.append(ch)
        if i in break_indices:
            result.append("-")
    return "".join(result)

def split_russian_text(text: str) -> str:
    """
    Split all Russian words in the given text string by syllables.
    Other tokens (numbers, punctuation, whitespace) are returned unchanged.
    """
    tokens = re.findall(r"[А-Яа-яЁё]+|\d+|[^А-Яа-яЁё\d\s]+|\s+", text)
    # Process each token that is a word
    for i, token in enumerate(tokens):
        if re.match(r"[А-Яа-яЁё]+$", token):
            tokens[i] = split_russian_word(token)
    return "".join(tokens)

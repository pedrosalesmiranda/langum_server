import re
import json
from collections import Counter

# === Config ===
FILE_PATH = "transcript.txt"
MAX_EXPRESSION_WORDS = 3
OUTPUT_JSON = "expressions.json"


def extract_text_lines(file_path):
    """Reads file and extracts only the spoken text (ignores timestamps)."""
    with open(file_path, "r", encoding="utf-8") as file:
        lines = file.readlines()
    return [re.sub(r"^\[.*?\]", "", line).strip() for line in lines if line.strip()]


def get_expressions(text_lines, max_words):
    """Splits lines into expressions of up to max_words."""
    all_expressions = []

    for line in text_lines:
        words = line.split()
        for size in range(1, max_words + 1):
            for i in range(len(words) - size + 1):
                expr = " ".join(words[i:i + size])
                all_expressions.append(expr.lower())  # Normalize case
    return all_expressions


def main():
    lines = extract_text_lines(FILE_PATH)
    expressions = get_expressions(lines, MAX_EXPRESSION_WORDS)
    counter = Counter(expressions)

    # Sort the map from most to least frequent
    sorted_map = dict(counter.most_common())

    # Export to JSON
    with open(OUTPUT_JSON, "w", encoding="utf-8") as f:
        json.dump(sorted_map, f, ensure_ascii=False, indent=2)

    print(f"\nExported {len(sorted_map)} expressions to '{OUTPUT_JSON}'.")


if __name__ == "__main__":
    main()

import re

def convert_to_srt(input_text):
    # Pattern to extract timestamp and text
    pattern = re.compile(r"\[(\d{2}:\d{2}:\d{2}\.\d{3})\s*-->\s*(\d{2}:\d{2}:\d{2}\.\d{3})\]\s*(.+)")

    matches = pattern.findall(input_text)
    srt_lines = []

    for i, (start, end, text) in enumerate(matches, start=1):
        # Replace . with , in timestamp (SubRip uses commas)
        start_srt = start.replace('.', ',')
        end_srt = end.replace('.', ',')
        srt_lines.append(f"{i}")
        srt_lines.append(f"{start_srt} --> {end_srt}")
        srt_lines.append(text.strip())
        srt_lines.append("")  # Blank line between subtitles

    return "\n".join(srt_lines)


# Example usage:
if __name__ == "__main__":
    input_file = "input.txt"  # File containing your original format
    output_file = "output.srt"

    with open(input_file, "r", encoding="utf-8") as f:
        input_text = f.read()

    srt_text = convert_to_srt(input_text)

    with open(output_file, "w", encoding="utf-8") as f:
        f.write(srt_text)

    print(f"✅ Converted and saved to {output_file}")

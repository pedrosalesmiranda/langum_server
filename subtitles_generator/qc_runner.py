# qc_runner.py

import json
import re
from pathlib import Path
from subtitles_rules import Subtitle, check_subtitles


def time_to_seconds(t):
    h, m, s_ms = t.split(":")
    s, ms = s_ms.split(",")
    return int(h) * 3600 + int(m) * 60 + int(s) + int(ms) / 1000


def parse_srt(path: Path):
    blocks = re.split(r"\n\s*\n", path.read_text(encoding="utf-8").strip())
    subs = []

    for block in blocks:
        lines = block.splitlines()
        index = int(lines[0])
        start, end = lines[1].split(" --> ")
        text = "\n".join(lines[2:])

        subs.append(
            Subtitle(
                index,
                time_to_seconds(start),
                time_to_seconds(end),
                text
            )
        )

    return subs


def run_qc(srt_path: str, rules_path="rules.json"):
    rules = json.loads(Path(rules_path).read_text(encoding="utf-8"))
    subs = parse_srt(Path(srt_path))
    return check_subtitles(subs, rules)

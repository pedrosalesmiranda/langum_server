# subtitles_rules.py

import re
from typing import List, Dict


class Subtitle:
    def __init__(self, index, start, end, text):
        self.index = index
        self.start = start
        self.end = end
        self.text = text

    @property
    def duration(self):
        return self.end - self.start

    @property
    def chars(self):
        return len(re.sub(r"<[^>]+>", "", self.text))

    @property
    def lines(self):
        return self.text.splitlines()


def check_subtitles(subs: List[Subtitle], rules: Dict) -> List[dict]:
    """
    Returns a list of QC issues:
    [{ index, rule, message, severity }]
    """
    issues = []

    for i, sub in enumerate(subs):
        duration = sub.duration

        # Duration
        if duration < rules["timing"]["min_duration_sec"]:
            issues.append(issue(sub, "DURATION_TOO_SHORT", "Subtitle too short"))

        if duration > rules["timing"]["max_duration_sec"]:
            issues.append(issue(sub, "DURATION_TOO_LONG", "Subtitle too long"))

        # Reading speed
        cps = sub.chars / duration if duration > 0 else 999
        if cps > rules["reading_speed"]["max_cps"]:
            issues.append(issue(
                sub,
                "CPS_TOO_HIGH",
                f"Reading speed {cps:.1f} CPS exceeds limit"
            ))

        # Layout
        if len(sub.lines) > rules["layout"]["max_lines"]:
            issues.append(issue(sub, "TOO_MANY_LINES", "More than 2 lines"))

        for line in sub.lines:
            if len(line) > rules["layout"]["max_chars_per_line"]:
                issues.append(issue(sub, "LINE_TOO_LONG", "Line exceeds max length"))

        # Gap
        if i > 0:
            gap = sub.start - subs[i - 1].end
            if gap < rules["timing"]["min_gap_sec"]:
                issues.append(issue(sub, "GAP_TOO_SMALL", "Gap between subtitles too small"))

    return issues


def issue(sub, rule, message, severity="ERROR"):
    return {
        "index": sub.index,
        "rule": rule,
        "message": message,
        "severity": severity
    }

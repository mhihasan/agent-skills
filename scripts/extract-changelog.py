#!/usr/bin/env python3
"""Extract release notes for a given version from CHANGELOG.md.

Usage: python extract-changelog.py 1.2.0
Writes release-notes.txt for use by the release workflow.
"""
import re
import sys
from pathlib import Path

version = sys.argv[1] if len(sys.argv) > 1 else ""

content = Path("CHANGELOG.md").read_text(encoding="utf-8")

# Split on level-2 headings
sections = re.split(r"\n(?=## )", content)

notes = ""
for section in sections:
    header = section.split("\n", 1)[0]
    if "Unreleased" in header or (version and version in header):
        # Drop the heading line itself
        body = "\n".join(section.split("\n")[1:]).strip()
        notes = body
        break

if not notes:
    print(f"Warning: no changelog section found for version '{version}'", file=sys.stderr)
    notes = f"Release {version}"

Path("release-notes.txt").write_text(notes, encoding="utf-8")
print(f"Extracted release notes for '{version}' → release-notes.txt")

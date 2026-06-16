#!/usr/bin/env python3
"""Validate SKILL.md frontmatter — required fields and valid YAML."""
import re
import sys
from pathlib import Path

import yaml

REQUIRED = ["name", "description"]

errors = []
checked = 0

for skill_file in sorted(Path("skills").rglob("SKILL.md")):
    content = skill_file.read_text(encoding="utf-8")
    match = re.match(r"^---\n(.*?)\n---", content, re.DOTALL)

    if not match:
        errors.append(f"{skill_file}: missing YAML frontmatter block")
        continue

    try:
        fm = yaml.safe_load(match.group(1)) or {}
    except yaml.YAMLError as exc:
        errors.append(f"{skill_file}: invalid YAML — {exc}")
        continue

    for field in REQUIRED:
        if not fm.get(field):
            errors.append(f"{skill_file}: missing required field '{field}'")

    checked += 1

if errors:
    print(f"Frontmatter validation failed ({len(errors)} error(s)):\n")
    for err in errors:
        print(f"  ✗ {err}")
    sys.exit(1)

print(f"✓ {checked} SKILL.md file(s) validated — all frontmatter is valid")

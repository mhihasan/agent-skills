#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/skills"

# ── SKILLS ──────────────────────────────────────────────────────────────────

link_skills() {
  local target_dir="$1"
  local linked=0 skipped=0

  for skill in "$SKILLS_SRC"/*/; do
    [ -d "$skill" ] || continue
    name="$(basename "$skill")"
    dest="$target_dir/$name"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
      echo "  SKIP (real dir, not a symlink): $dest"
      skipped=$((skipped + 1))
    else
      ln -sfn "$skill" "$dest"
      echo "  LINKED: $dest -> $skill"
      linked=$((linked + 1))
    fi
  done

  echo "  → $linked linked, $skipped skipped"
}

echo ""
echo "agentic-skills install.sh"
echo "──────────────────────────────────────────────────────"

# Claude Code — and all tools that share ~/.claude/skills/ (OpenCode, Cursor, etc.)
[ -d "$HOME/.claude/skills" ] \
  && { echo "[~/.claude/skills]"; link_skills "$HOME/.claude/skills"; } \
  || echo "[~/.claude/skills] not found — skipping"

# ── COMMANDS  (add later) ────────────────────────────────────────────────────
# ── RULES     (add later) ────────────────────────────────────────────────────
# ── SUBAGENTS (add later) ────────────────────────────────────────────────────

echo ""
echo "Note: agentic-skills contains engineering craft skills only."
echo "For personal skills (voice, career, interview prep), also install:"
echo "  https://github.com/mhihasan/exocortex"
echo ""
echo "Done."

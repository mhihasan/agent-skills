#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/skills"

# ── HELPERS ───────────────────────────────────────────────────────────────────

link_skills() {
  local target_dir="$1"
  local linked=0 skipped=0

  mkdir -p "$target_dir"

  for skill in "$SKILLS_SRC"/*/; do
    [ -d "$skill" ] || continue
    name="$(basename "$skill")"
    dest="$target_dir/$name"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
      echo "  SKIP (real dir, not a symlink): $dest"
      skipped=$((skipped + 1))
    else
      ln -sfn "$skill" "$dest"
      echo "  LINKED: $dest"
      linked=$((linked + 1))
    fi
  done

  echo "  → $linked linked, $skipped skipped"
}

# ── SCOPE SELECTION ───────────────────────────────────────────────────────────

# Accept --scope user|project as an argument, otherwise prompt
SCOPE=""
for arg in "$@"; do
  case "$arg" in
    --scope=user)    SCOPE="user" ;;
    --scope=project) SCOPE="project" ;;
    --scope=both)    SCOPE="both" ;;
  esac
done

echo ""
echo "agentic-skills install.sh"
echo "──────────────────────────────────────────────────────"

if [ -z "$SCOPE" ]; then
  echo ""
  echo "Where do you want to install the skills?"
  echo "  1) User scope   — ~/.claude/skills/  (available in all projects)"
  echo "  2) Project scope — .claude/skills/   (current directory only)"
  echo "  3) Both"
  echo ""
  read -r -p "Choice [1/2/3] (default: 1): " choice
  case "${choice:-1}" in
    2) SCOPE="project" ;;
    3) SCOPE="both" ;;
    *) SCOPE="user" ;;
  esac
fi

# ── INSTALL ───────────────────────────────────────────────────────────────────

if [ "$SCOPE" = "user" ] || [ "$SCOPE" = "both" ]; then
  USER_SKILLS="$HOME/.claude/skills"
  echo ""
  echo "[user scope] $USER_SKILLS"
  link_skills "$USER_SKILLS"
fi

if [ "$SCOPE" = "project" ] || [ "$SCOPE" = "both" ]; then
  PROJECT_SKILLS="$(pwd)/.claude/skills"
  echo ""
  echo "[project scope] $PROJECT_SKILLS"
  link_skills "$PROJECT_SKILLS"
fi

# ── DEPENDENCY CHECK ──────────────────────────────────────────────────────────

SUPERPOWERS_DIR="$HOME/.claude/plugins/cache/claude-plugins-official/superpowers"
if [ ! -d "$SUPERPOWERS_DIR" ]; then
  echo ""
  echo "WARNING: superpowers plugin not found at $SUPERPOWERS_DIR"
  echo "  This workflow composes superpowers skills at several pipeline steps:"
  echo "  test-driven-development, systematic-debugging, verification-before-completion,"
  echo "  using-git-worktrees, dispatching-parallel-agents, finishing-a-development-branch."
  echo "  Install it in Claude Code:"
  echo "    /plugin install superpowers@claude-plugins-official"
  echo "  Or visit: https://claude.com/plugins/superpowers"
fi

echo ""
echo "Note: agentic-skills contains engineering craft skills only."
echo "For personal skills (voice, career, interview prep), also install:"
echo "  https://github.com/mhihasan/exocortex"
echo ""
echo "Done."

# Install Options

Default (no args) installs the latest version for all tools at user scope:

```bash
curl -fsSL https://raw.githubusercontent.com/mhihasan/agentic-sdlc/main/install.sh | bash
```

Pin to a specific release tag:

```bash
curl -fsSL https://raw.githubusercontent.com/mhihasan/agentic-sdlc/main/install.sh | bash -s -- --tag=v1.2.3
```

---

## `--tool`

| Value | Installs for | Skills land in |
|---|---|---|
| `all` (default) | Claude Code + Copilot | `~/.claude/skills/` + `~/.copilot/skills/` |
| `claude` | Claude Code, OpenCode, Cursor | `~/.claude/skills/` |
| `copilot` | GitHub Copilot | `~/.copilot/skills/` |

```bash
# Claude only
curl -fsSL https://raw.githubusercontent.com/mhihasan/agentic-sdlc/main/install.sh | bash -s -- --tool=claude

# Copilot only
curl -fsSL https://raw.githubusercontent.com/mhihasan/agentic-sdlc/main/install.sh | bash -s -- --tool=copilot
```

---

## `--scope`

| Value | Effect | Skills land in |
|---|---|---|
| `user` (default) | Available in all projects | `~/.claude/skills/` or `~/.copilot/skills/` |
| `project` | This project only — requires a path | `<path>/.claude/skills/` or `<path>/.github/skills/` |

```bash
# Project-scoped (Claude)
curl -fsSL https://raw.githubusercontent.com/mhihasan/agentic-sdlc/main/install.sh | bash -s -- --scope=project --tool=claude /path/to/your-project

# Project-scoped (all tools)
curl -fsSL https://raw.githubusercontent.com/mhihasan/agentic-sdlc/main/install.sh | bash -s -- --scope=project --tool=all /path/to/your-project
```

---

Safe to re-run — existing symlinks are updated, real directories are never overwritten.

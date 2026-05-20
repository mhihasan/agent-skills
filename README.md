# agent-skills

Generic engineering craft skills for AI coding assistants.

Book-grounded, employer-neutral, and reusable by any engineer. Works with
Claude Code, OpenCode, Cursor, and any tool that reads `~/.claude/skills/`.

## Skills

| Skill | Grounded in |
|---|---|
| `clean-architecture` | Robert C. Martin — *Clean Architecture* (2017) |
| `clean-coding` | Robert C. Martin — *Clean Code* (2008) |
| `ddd-expert` | Eric Evans — *Domain-Driven Design* (2003) |
| `design-doc-generator` | Generates production-grade architecture docs from a codebase |
| `design-patterns-expert` | Alexander Shvets — *Dive Into Design Patterns* (2022) |
| `pragmatic-engineer` | Thomas & Hunt — *The Pragmatic Programmer* (2019) |
| `pytest-expert` | Opinionated pytest best practices for Python |
| `system-designing` | Kleppmann & Riccomini — *Designing Data-Intensive Applications* (2nd ed.) |

## Installation

```bash
git clone git@github.com:mhihasan/agent-skills.git ~/repos/agentic-skills
cd ~/repos/agentic-skills
./install.sh
```

`install.sh` symlinks all skills into `~/.claude/skills/` (and any other
agent tool directories detected on your machine). Safe to re-run — existing
symlinks are updated, real directories are never overwritten.

Personal skills (voice, career, interview prep) live separately in
[mhihasan/exocortex](https://github.com/mhihasan/exocortex).
Both repos install independently.

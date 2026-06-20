# /sdlc-start — Usage Reference

## Invocation forms

```bash
/sdlc-start <url>           # Jira ticket URL
/sdlc-start <key>           # Jira key — PROJ-42
/sdlc-start <path>          # local ticket file already on disk
/sdlc-start "<idea>"        # free-form idea — routes to brainstorming
/sdlc-start                 # no argument — resumes in-progress work or asks
```

## Modes

### Collaborative (default)

Pauses at every decision point — routing confirmation, spec approval, resume prompt. You drive; the skill delegates and connects.

```bash
/sdlc-start PROJ-42
```

### Auto

Removes conversational pauses. Routing, delegation, and active-state writes happen without prompts. Halts only on genuine ambiguity (input matches no rule) or upstream skill failure.

```bash
/sdlc-start PROJ-42 auto
```

**What `auto` does not remove:**
- Human gate in `picking-up-task` (branch creation requires your approval)
- Human gate in `planning-from-spec` (plan review requires your approval)
- Resume prompt when multiple active tasks exist (you must pick which)

## Input detection rules (applied in order)

| Priority | Matches | Example | Routes to |
| --- | --- | --- | --- |
| 1 | Starts with `http://` or `https://` | `https://site.atlassian.net/browse/PROJ-42` | `picking-up-task` |
| 2 | Pattern `[A-Z]+-[0-9]+` | `PROJ-42` | `picking-up-task` |
| 3 | Path to a file that exists on disk | `local-dev/tickets/PROJ-42/PROJ-42.md` | `picking-up-task` |
| 4 | Any other non-empty string | `"add dark mode toggle"` | `brainstorming` |
| 5 | No argument | — | resume check (see below) |

Detection is deterministic — no model judgment involved. If your input is ambiguous between rules, `/sdlc-start` asks before routing.

## Resume logic (no argument)

Reads `.agentic-sdlc/active/` at repo root.

**No active files** — asks for new input. Re-applies detection rules 1–4 to your answer.

**One active file** — shows the in-progress task and asks `continue? (yes / no / new)`.

```
In progress: PROJ-42 · implementing-tasks · "Task 3 — add toggle component"
Branch: feat/PROJ-42/add-dark-mode

Continue? (yes / no / new)
```

**Multiple active files** — lists all, asks which to resume or whether to start new.

```
Active work:
  [1] PROJ-42 · implementing-tasks · "Task 3 — add toggle component"
  [2] PROJ-55 · planning-from-spec

Continue which? (1 / 2 / new)
```

## Active state file

Each in-progress work item writes a file at `.agentic-sdlc/active/<KEY>.md`. Updated by each pipeline skill as work advances. Deleted by `crafting-commits` on completion.

```markdown
key: PROJ-42
step: implementing-tasks
task: "Task 3 — add toggle component"
branch: feat/PROJ-42/add-dark-mode
ticket: local-dev/tickets/PROJ-42/PROJ-42.md
plan: local-dev/tickets/PROJ-42/PLAN-PROJ-42.md
```

Fields:

| Field | Set by | Value |
| --- | --- | --- |
| `key` | `sdlc-start` / `picking-up-task` | Jira key or idea slug |
| `step` | each skill on completion | name of the next skill to run |
| `task` | `implementing-tasks` | current task description |
| `branch` | `picking-up-task` | git branch name |
| `ticket` | `sdlc-start` | path to ticket or spec file |
| `plan` | `planning-from-spec` | path to PLAN file |

## Pipeline paths

### Ticket path (URL / key / local file)

```
/sdlc-start
  └─ picking-up-task      fetch ticket · create branch · write ticket file
       └─ planning-from-spec
            └─ generating-tasks     [YOU APPROVE]
                 └─ reviewing-plan  [AI JUDGE]
                      └─ implementing-tasks  [YOU APPROVE]
                           └─ reviewing-code [AI JUDGE]
                                └─ crafting-commits  [YOU APPROVE]
```

### Idea path (free-form text)

```
/sdlc-start "idea"
  └─ brainstorming        clarify · design · write spec to local-dev/specs/
       └─ planning-from-spec
            └─ (same tail as ticket path)
```

### Resume path (no argument)

```
/sdlc-start
  └─ reads .agentic-sdlc/active/
       └─ resumes at saved step with saved file paths
```

## Entering the pipeline mid-way

You do not have to start at `/sdlc-start`. If the upstream artifact already exists, invoke any skill directly:

```bash
/planning-from-spec local-dev/tickets/PROJ-42/PROJ-42.md
/generating-tasks   local-dev/tickets/PROJ-42/PLAN-PROJ-42.md
/reviewing-code                          # reviews current branch diff
```

`/sdlc-start` is the convenience wrapper — it adds routing and active-state tracking, not gating.

## What /sdlc-start does NOT do

- Re-implement ticket fetching, branch creation, or brainstorming — it delegates entirely
- Proceed past no-argument without checking `.agentic-sdlc/active/` first
- Write `.agentic-sdlc/active/` before the upstream skill completes and you approve
- Accept ambiguous input silently — asks when detection is uncertain

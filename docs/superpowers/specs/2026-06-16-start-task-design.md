# start-task Skill Design

**Date:** 2026-06-16
**Status:** Approved

## Problem

The current pipeline has two separate entry points a developer must run manually before starting any work:

1. `[0] using-git-worktrees` — set up isolated workspace
2. `[1] fetching-tickets` — pull Jira ticket to disk

This is unnecessary friction. A developer starting a task should have one command that handles both.

## Solution

Add a `start-task` skill as the single human-facing pipeline entry point. It:
- Detects the input type (Jira URL/key or local file)
- Delegates to `fetching-tickets` for Jira fetches
- Sets up the branch (or worktree on request)
- Hands off to `planning-from-ticket`

`fetching-tickets` is not deleted — it becomes an internal sub-skill, no longer user-facing.

## Updated Pipeline

```
[1] start-task               ← replaces [0] using-git-worktrees + [1] fetching-tickets
[2] planning-from-ticket
[3] generating-tasks
[4] reviewing-plan
[5] implementing-tasks
[6] reviewing-code
[6.5] crafting-commits
[7] finishing-a-development-branch
```

---

## Section 1 — Purpose & Position

`start-task` is the bootstrap step of the feature workflow. It ensures the developer has:
- The ticket content on disk (when input is a Jira URL/key)
- A clean, up-to-date branch ready for work

It is opt-in only — never triggered automatically. The developer explicitly invokes it when starting a new task.

---

## Section 2 — Input Detection & Routing

`start-task` accepts one required argument and detects the source type:

| Input | Example | Action |
|---|---|---|
| Jira URL | `https://site.atlassian.net/browse/PROJ-42` | Extract key, invoke `fetching-tickets` |
| Jira key | `PROJ-42` | Invoke `fetching-tickets` |
| Local file | `./tickets/PROJ-42/PROJ-42.md` | Read file directly |
| Anything else | `"add password reset"` | Reject — tell developer to provide a ticket URL, key, or local file |

**Confirm before fetching:**
> *"Looks like PROJ-42 — should I fetch it and set up a branch?"*

Ad-hoc descriptions are explicitly rejected. `start-task` is a task onboarding skill, not a planning entry point. If there is no ticket, the developer goes to `planning-from-ticket` directly with a spec file.

---

## Section 3 — Workspace Setup

After the ticket is confirmed and fetched:

1. **Detect default branch** — `git remote show origin | grep 'HEAD branch'`
2. **Ask developer to confirm base branch** — show detected default as suggestion, allow override
3. **Check for dirty working tree** — if uncommitted changes exist, ask before proceeding (never stash silently)
4. **Sync** — `git fetch origin && git checkout <base-branch> && git pull`
5. **Construct branch name** from ticket metadata:
   ```
   {type}/{ticket-key}/{slug}
   e.g. feat/PROJ-42/add-user-auth
   ```
   - `type`: conventional commit type (`feat`, `fix`, `refactor`, `chore`, `docs`, `test`, `ci`) — ask developer if not clear from ticket
   - `slug`: 2-4 word kebab-case summary derived from ticket title
6. **Confirm with developer** — *"I'll create branch `feat/PROJ-42/add-user-auth` based off `develop` — sound good?"*
7. **Create branch** — `git checkout -b feat/PROJ-42/add-user-auth`

**No push** — branch stays local until the developer makes their first commit. `finishing-a-development-branch` handles push + PR at the end.

### `--worktree` flag

By default `start-task` creates a plain branch. If the developer passes `--worktree`:

```
/start-task PROJ-42 --worktree
```

After constructing the branch name and confirming with the developer, `start-task` invokes `using-git-worktrees` instead of creating a plain branch. All worktree logic (directory placement, safety verification, project setup, baseline tests) is owned by that skill.

**When to use `--worktree`:**
- You have in-flight work on another branch and don't want to switch
- You're about to dispatch an agent to implement this task in parallel
- You want full isolation between concurrent tasks

**Branch vs worktree — the axis is parallelism, not mode.** Sequential work → plain branch. Parallel work → worktree.

---

## Section 4 — Handoff

Once the branch (or worktree) is ready, print a brief summary and point to the next step:

```
Branch `feat/PROJ-42/add-user-auth` ready (based off `develop`).
Ticket saved to `tickets/PROJ-42/PROJ-42.md`.

Next: /planning-from-ticket tickets/PROJ-42/PROJ-42.md
```

No extra guidance, no push commands, no reminders.

---

## Decisions & Rationale

| Decision | Rationale |
|---|---|
| `fetching-tickets` kept as sub-skill | Owns complex Jira logic (custom fields, image download, self-review). Thin orchestrator pattern — same as `planning-from-ticket` → `brainstorming`. |
| Plain branch by default | Most developers work sequentially. Worktrees are opt-in for parallel/agent use cases. |
| `--worktree` delegates to `using-git-worktrees` | That skill owns worktree creation logic. No duplication. |
| No push on branch creation | Empty branch on remote adds no value. `finishing-a-development-branch` owns push + PR. |
| Ad-hoc descriptions rejected | `start-task` is onboarding, not planning. No ticket = go to `planning-from-ticket` directly. |
| Ask developer for base branch | Default branch varies per repo (`main`, `develop`, `master`). Developer confirms, skill doesn't assume. |
| No auto-trigger | Opt-in only. Developer explicitly starts a task — never triggered by pipeline automation. |

---

## What Changes in Existing Skills

| Skill | Change |
|---|---|
| `fetching-tickets` | Becomes internal sub-skill. Description updated to reflect it is invoked by `start-task`, not directly by the user. |
| `implementing-tasks` | Remove "optional" qualifier from worktree step. Make it explicit: collaborative mode → plain branch already set up by `start-task`; auto mode → invoke `using-git-worktrees`. |
| README pipeline diagram | Replace `[0] using-git-worktrees` + `[1] fetching-tickets` with `[1] start-task`. |

---

## Out of Scope

- GitHub issue / PR number support (Jira-first; GitHub issues can be added later)
- Context file creation (documents-ui pattern — not needed here, ticket is already on disk)
- Auto-detection of task type from ticket content (ask the developer — they know their conventions)

# Changelog

All notable changes to coding-agent-skills are documented here.

## Unreleased

### Added
- **Self-review gates** at every artifact boundary: `fetching-tickets`, `generating-tasks`, `crafting-commits` — objective/mechanical checklists the producing skill runs before handoff
- **Deepened `planning-from-ticket` self-review** — added grounding-verified check (every named file/function was actually read in step 2)
- **Mode contract** across the full pipeline — every skill now accepts `auto` argument; collaborative is the default; `auto` relaxes forward-progress pauses but never relaxes git writes or judge halts
- **Fresh-context judge subagents** in `reviewing-plan` and `reviewing-code` — judges run on a strong model with only the artifact + ticket + rubric, no prior conversation context (self-preference bias guardrail)
- **Verdict marker** in `reviewing-plan` — emits `> **Plan Review:** PROCEED — date` to the PLAN file after a PROCEED verdict (the signal `implementing-tasks` checks)
- **Hard gate in `implementing-tasks`** — refuses to start without a `reviewing-plan` verdict marker in the plan file
- **`crafting-commits` as mandatory pipeline step** — reframed from optional to required before `finishing-a-development-branch`
- **Mermaid pipeline diagram** in README — replaces ASCII art; colour-coded nodes, dotted fix-and-retry edges
- **Review tiers**, **mode contract**, and **recommended model tiers** tables in README
- MIT LICENSE file
- CONTRIBUTING.md
- GitHub issue templates (bug report, skill request)

### Changed
- `reviewing-plan` Core Principle updated: "the user must approve" → mode-aware ("a plan must be reviewed before it's trusted"; in `auto`, the independent judge replaces the human chat-gate)
- `reviewing-code` Next Steps: `crafting-commits` changed from suggestion to mandatory gate
- README: hook rewritten, quickstart added, superpowers sub-skills table added, repo renamed to `coding-agent-skills`

## [0.1.0](https://github.com/mhihasan/coding-agent-skills/compare/v0.0.1...v0.1.0) (2026-06-16)


### Features

* add Claude plugin manifest and marketplace for distribution ([e43fea7](https://github.com/mhihasan/coding-agent-skills/commit/e43fea7896243c64256f430e7d021a3aee80aafa))
* add Claude plugin manifest and marketplace for distribution ([0606d61](https://github.com/mhihasan/coding-agent-skills/commit/0606d61ce81bb7c2ff532bdcc27cfd24c9305cce))


### Bug Fixes

* disable MD004 for Release Please generated CHANGELOG ([1a2eaec](https://github.com/mhihasan/coding-agent-skills/commit/1a2eaec1a69bad543177e7513baba309ee0a16a4))
* disable MD004 for Release Please generated CHANGELOG ([bc8db49](https://github.com/mhihasan/coding-agent-skills/commit/bc8db495f948ae0fc1e4dd075e7377082450995a))
* resolve pre-commit linting failures ([cb91702](https://github.com/mhihasan/coding-agent-skills/commit/cb91702edf26f6a48af4f2f1b553213c7923220f))
* silence noisy markdownlint rules; fix broken TOC link ([6dc3f7a](https://github.com/mhihasan/coding-agent-skills/commit/6dc3f7a817f1b8fa0144648f1040c959315a3ef8))
* silence noisy markdownlint rules; fix broken TOC link in component-patterns ([75e3449](https://github.com/mhihasan/coding-agent-skills/commit/75e34493d7fb697e727d1e2642cf3e1f7f877536))

## 0.1.0 — Initial release

Pipeline skills: `fetching-tickets`, `planning-from-ticket`, `generating-tasks`, `reviewing-plan`, `implementing-tasks`, `reviewing-code`, `crafting-commits`.

Craft skills: `clean-architecture`, `clean-coding`, `ddd-expert`, `design-patterns-expert`, `design-doc-generator`, `pragmatic-engineer`, `system-designing`, `pytest-expert`, `vitest-react`.

Superpowers integration: `brainstorming`, `writing-plans`, `test-driven-development`, `systematic-debugging`, `verification-before-completion`, `requesting-code-review`, `receiving-code-review`.

# Universal Review Checks

Stack-agnostic review dimensions. Always available. Run the subset the triage selects.
Each check lists Purpose, Focus areas, and When to skip. Findings use the shared severity scale and false-positive rules from SKILL.md.

---

## Task Completion Verification

**Pipeline mode only. Always included in pipeline mode** (skip only if the developer explicitly wants quality-only).

**Purpose:** Trace every requirement from the plan → task spec → implementation. "Did we deliver what we promised?"

**Focus areas:**
- Every test scenario in the task spec has a corresponding test that exists and passes
- Every "New"/"Modified" file matches expectations; no "Must NOT modify" file touched; no unexpected files created
- Scope boundaries respected; key decisions from the plan followed
- Anything unverifiable from code → flagged as a manual check

**Report section:**
```
## Task Completion
**Criteria:** [X/Y verified]
| # | Criterion | Status | Evidence |
**File Verification:** | Expected | Status | Notes |
**Scope:** [✅ Respected | ❌ Violated — why]
**Plan Decisions:** [✅ Followed | ❌ Deviated — why]
```

---

## Code Quality & Patterns

**Purpose:** Conventions, structure, common quality issues.

**Focus areas:** duplication/DRY; clear consistent naming; single responsibility; dead code / unused imports; function length & cyclomatic complexity; magic numbers; deep nesting (>3); folder-structure & naming per CLAUDE.md; matches pattern references in the task spec; layer boundaries respected; import style consistent; no new circular dependencies.

**Skip when:** pure docs or config-only changes.

---

## Test Coverage & Quality

**Purpose:** Coverage gaps and test quality.

**Focus areas:** tests exist for new/changed code; edge cases (null, empty, boundary); error/exception scenarios; isolation (no shared mutable state / order dependence); names describe behavior; Arrange-Act-Assert; mocks at boundaries not the unit under test; no flaky patterns (hardcoded timeouts, races, external deps); specific assertions (not "exists"); regression tests for bug fixes. For each untested path, give a concrete example test.

**Skip when:** developer observed every test during TDD; non-test/non-production changes.

---

## Performance

**Purpose:** Performance and scaling issues.

**Focus areas:** algorithmic complexity (flag O(n²)/O(n³)); memory; **non-database N+1** (API-call loops, repeated computation — DB N+1 belongs to the database reference); missing caching; work inside loops; large structure ops (deep clones, big copies); sequential work that could be parallel; resource cleanup (streams, connections, handles); batchable individual calls; bundle-size impact of new deps.

For each finding, estimate impact at 10x / 100x / 1000x data.

**Skip when:** simple CRUD, config, docs, tests-only.

---

## Security

**Purpose:** Vulnerabilities and hardening.

**Focus areas:** input validation/sanitization; injection (SQL/XSS/CSRF/path traversal); authn/authz present; secrets exposure; sensitive data not in logs/errors; CORS; rate limiting on sensitive routes; token handling (expiry/rotation/storage); file-upload safety; dependency CVEs; OWASP Top 10.

For Critical/High: explain the attack vector briefly.

**Skip when:** internal utilities with no user-facing surface; pure refactor of already-validated code; docs; tests-only.

---

## Error Handling & Observability

**Purpose:** Error patterns, logging, operational readiness.

**Focus areas:** try/catch appropriateness & specificity; clear useful error messages; logging levels; no sensitive data in logs; graceful degradation; retry/circuit-breaker where appropriate; proper error propagation; stack-trace preservation; user-facing vs internal errors separated; cleanup in error paths.

**Skip when:** docs, config-only, simple data-model changes.

---

## Documentation

**Purpose:** Changes carry appropriate docs.

**Focus areas:** README for new/changed behavior; API docs (endpoints, params, responses); comments for the "why" of complex logic; doc-comments on public/exported APIs; config docs (new env vars/options); migration guides for breaking changes; CLAUDE.md updated for new patterns; internal accuracy (paths/imports/config examples match reality); cross-references point to things that exist.

Evaluate: could a new teammate understand the change from the docs alone?

**Skip when:** internal implementation details; test files; refactors not changing public interfaces.

---

## Configuration & Dependencies

**Purpose:** Config and dependency risk.

**Focus areas:** env var usage & docs; config changes across all environments; new deps (size, maintenance, license); version updates (breaking changes, changelog); lock-file consistency; default-value appropriateness; known CVEs; build/CI impacts.

For each new/updated dependency: size, maintenance status, risk.

**Skip when:** no config/dependency changes.

---

## Migration & Breaking Changes

**Purpose:** Backward-compatibility and migration safety.

**Focus areas:** API contract changes (removed/renamed fields, changed shapes/status codes); destructive DB migrations (DROP, column removal), missing rollback, data migration for existing rows; breaking changes to shared libs/packages/SDKs consumed elsewhere; feature flags for risky rollouts; env var add/remove across environments; URL/route changes breaking clients; event/message schema changes affecting consumers; deprecation notices.

For each finding: who's affected, how many consumers, is there a migration path?

**Skip when:** internal-only with no external consumers; tests-only; docs; purely additive changes.

---

## Accessibility

**Purpose:** a11y issues in any HTML-generating code.

**Focus areas:** missing ARIA (`aria-label`, `role` on interactive elements); keyboard navigation (Tab reachability, key handlers for click-only elements); semantic HTML over `div`/`span`; form a11y (label/`htmlFor`/`id`, error announcements); focus management after dynamic changes (modals, route transitions, toasts); image `alt`; color contrast (WCAG AA 4.5:1 / 3:1); ARIA live regions for dynamic updates; heading hierarchy.

For each finding, cite the WCAG 2.1 criterion (e.g. "WCAG 2.1.1 Keyboard").

**Skip when:** no frontend/UI files; backend/API-only; tests-only.

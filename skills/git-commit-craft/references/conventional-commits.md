# Conventional Commits Reference

## Valid Types

| Type | When to use |
|------|-------------|
| `feat` | A new feature or user-facing capability |
| `fix` | A bug fix |
| `refactor` | Code restructuring with no behavior change and no bug fixed |
| `perf` | A change that improves performance |
| `test` | Adding or correcting tests only |
| `docs` | Documentation only |
| `style` | Formatting, whitespace, semicolons — no logic change |
| `chore` | Build process, dependency updates, tooling, config |
| `ci` | CI/CD pipeline changes |
| `revert` | Reverts a previous commit |
| `build` | Changes to build system or external dependencies |

**When in doubt between `feat` and `refactor`:** if the public interface or user-observable behavior changes, it's `feat`. If internal structure changes but outputs are identical, it's `refactor`.

**`fix` vs `refactor`:** `fix` means something was broken. `refactor` means it worked but was restructured.

---

## Scope Guidelines

The scope is the **logical unit** affected, not a filename.

**Good scopes:**
- Module name: `auth`, `payments`, `notifications`
- Component name: `UserCard`, `SearchBar`, `Modal`
- Feature name: `onboarding`, `checkout`, `rate-limiting`
- Layer: `api`, `db`, `cache`, `queue`
- Package (monorepo): `web`, `mobile`, `api`, `infra`

**Bad scopes:**
- Filenames: `userService.ts`, `index.js`
- Ticket numbers: `JIRA-123`
- Vague: `stuff`, `misc`, `changes`
- Too broad: `backend`, `frontend` (unless it really is cross-cutting)

**Omit scope** only when the change is truly global (e.g. `chore: upgrade Node to 20`, `ci: add lint step`).

---

## Description Rules

- Imperative mood: "add", "fix", "remove", "update" — not "added", "fixing", "removed"
- No capital first letter after the colon
- No period at the end
- Under 72 characters
- Describes **what** changed, not how

**Good:**
```
feat(auth): add OAuth2 PKCE flow for mobile clients
fix(payments): prevent double-charge on network retry
refactor(UserCard): extract avatar logic into useAvatar hook
chore(deps): upgrade React to 18.3.0
```

**Bad:**
```
fix stuff                          # no type, vague
feat: Added new login page.        # past tense, trailing period
fix(userService.ts): fixed the bug # filename scope, vague
WIP                                # placeholder
update                             # not semantic
```

---

## Body Guidelines (optional)

Use a body when **why** is not obvious from the diff.

```
fix(payments): prevent double-charge on network retry

Payment processor webhooks can arrive out of order. Added idempotency
key based on order ID + timestamp to prevent duplicate charges when
the client retries on a timeout.
```

Skip the body for mechanical changes: dependency bumps, formatting, renaming.

---

## Breaking Changes

If a change breaks the public API or contract, add a footer:

```
feat(api): remove deprecated /v1/users endpoint

BREAKING CHANGE: /v1/users is removed. Use /v2/users with the new
pagination parameters.
```

---

## Examples by Scenario

**Adding a new feature with tests:**
```
feat(search): add fuzzy matching for product names
test(search): add unit tests for fuzzy match scoring
```
(or combined into one commit if tests are small)

**Bug fix with a config change:**
```
fix(cache): set TTL on session tokens to prevent stale auth
chore(config): add SESSION_TTL env var to .env.example
```

**Refactor across multiple files in one module:**
```
refactor(checkout): extract price calculation into PriceEngine class
```
(single commit is fine — the scope signals the boundary)

**Monorepo cross-cutting change:**
```
chore: migrate all packages to pnpm workspaces
```
(no scope — affects everything)

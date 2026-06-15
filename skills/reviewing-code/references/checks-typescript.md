# TypeScript Strictness Checks

Load only when TypeScript files are in the diff. Uses the 2-Level Tracing Protocol (see SKILL.md).

**Purpose:** Deep type-safety analysis.

**Focus areas:**
- `any` usage — lazy or necessary? Do proper types exist?
- Type assertions (`as X`), especially `as unknown as X` chains
- Non-null assertions (`!`) — trace to see if null is actually possible
- `@ts-ignore` / `@ts-expect-error` — what's suppressed?
- Loose/missing/over-complex generics
- Missing explicit return types on exported functions
- Implicit `any` returns, `Promise<any>`
- Array methods that lose type info (`.reduce()` without a type param)
- Patterns that fail under `strictNullChecks` / `noImplicitAny`
- Index access without undefined handling

**Skip when:** no TypeScript files changed.

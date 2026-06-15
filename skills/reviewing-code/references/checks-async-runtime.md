# Async & Runtime Checks (JavaScript / Node.js)

Load only for JS/TS diffs with async code or runtime-heavy logic. Uses the 2-Level Tracing Protocol (see SKILL.md).

## Async Patterns

**Focus areas:**
- Unhandled rejections — async called without `await`/`.catch`; trace callers to see if anything handles it
- Sequential vs parallel — independent awaits that could be `Promise.all`; `await` inside loops
- Race conditions — state updates after async without checking relevance; missing abort/cancellation
- Resource cleanup — no `AbortController`; stream/connection not closed in error paths; missing timeout cleanup
- Error propagation — try/catch that swallows; `.catch` that doesn't re-throw
- `new Promise` wrapping already-async code

**Skip when:** no async code; non-JS/TS.

## Runtime Behavior

**Focus areas:**
- Hidden class / megamorphism (conditional properties; properties added after creation)
- Event-loop blocking (sync ops on large data; CPU-heavy work without chunking)
- Memory leaks (listeners without removal; timers without cleanup; closures capturing large scopes; unbounded arrays/maps)
- Prototype pollution (property access with user-controlled keys; deep merge without prototype checks)
- Reference vs value (mutating shared objects; in-place array mutation)
- Detached DOM references (browser code)

**Skip when:** no JS/TS files; docs/config-only.

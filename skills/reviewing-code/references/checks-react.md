# React / Next.js Checks

Load only when React/Next.js files are in the diff. Uses the 2-Level Tracing Protocol (see SKILL.md).

**Focus areas:**
- Hooks rules (conditional calls; calls after early returns)
- Stale closures (useEffect/useCallback capturing changing vars; missing dependency entries)
- Unstable references (object/array literals in render; functions without useCallback; missing useMemo)
- Hydration mismatches (date formatting, random values, browser-only APIs in initial render)
- Server/client boundaries (missing `'use client'`/`'use server'`; non-serializable props across boundary)
- Derived state stored in useState instead of computed
- Context overuse causing unnecessary re-renders
- Next.js file-based routing — non-route files (tests, utils, constants) under `pages/`/`app/` that Next treats as routes

**Skip when:** no React/Next.js files; projects without React.

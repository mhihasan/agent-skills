# Database Checks

Load only when database/ORM operations are in the diff. Uses the 2-Level Tracing Protocol (see SKILL.md).
This check owns ALL database/ORM N+1 analysis (non-database N+1 belongs to Performance in checks-universal.md).

**Focus areas:**
- N+1 queries — query inside a loop; fetching relations separately instead of include/join
- Transactions — related writes without a transaction; scope too large; missing rollback
- Connection pool — long ops holding connections; missing release in error paths
- Query injection — string interpolation in raw queries; user input without parameterization
- Performance — `SELECT *` when few fields needed; unbounded queries without limit; sorting in app vs DB
- Missing indexes for query patterns (if schema visible)

For each finding, estimate impact: "With N records, this means M queries."

**Skip when:** no database operations; projects without a database dependency.

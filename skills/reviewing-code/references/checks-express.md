# Express Checks

Load only when Express route/middleware files are in the diff. Uses the 2-Level Tracing Protocol (see SKILL.md).

**Focus areas:**
- Middleware ordering (error handlers not last; auth after route handlers; body parsing missing)
- Async route handlers without try/catch (Express 4 doesn't catch rejections)
- Multiple `res.send`/`res.json` possible in one handler — trace all code paths
- Request body/params used without validation; type coercion (`req.params.id` is always string)
- CORS misconfiguration; missing security headers; session/cookie issues
- Rate-limiting gaps on sensitive routes

**Skip when:** no Express route/middleware changes; projects without Express.

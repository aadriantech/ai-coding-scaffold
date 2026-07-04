# Error library

One line per **failure class** agents hit more than once. Search before retrying.

| ID | Symptom | Root cause | Fix |
|----|---------|------------|-----|
| E001 | Playwright route mock ignored | SSR/server `load()` uses Node fetch, not browser | Mock at API layer, query-param test hook, or form action |
| E002 | Svelte form submits as GET | `onsubmit` not preventing default / no hydration | SvelteKit `use:enhance` + `method="POST"` action |
| E003 | Mobile menu click no-op | Client JS not hydrated before click | Native `<details>/<summary>` or wait for `networkidle` |
| E004 | E2E uses wrong API URL | `reuseExistingServer` + stale dev env | `PUBLIC_API_URL=http://localhost:8081/v1` + fresh dev or Docker API |

Add rows via `/error-sync` after AYSU `loop_back: yes`.
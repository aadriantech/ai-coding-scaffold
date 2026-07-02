# AGENT — Tests

**Scope:** Test suite, TDD discipline, coverage.  
**Owns:** `src/**/*.test.ts`, `e2e/**`  
**Depends on:** ROOT  
**Last verified:** 2026-07-01 · Vitest + Playwright baseline

## Conventions

- **Unit:** Vitest — `npm test` / `npm run test:coverage` (≥90% on `src/lib/`)
- **E2E (CI):** Playwright — `npm run test:e2e` (serves `demo/` on port 5173)
- **UI (Grok):** MCP Playwright — `/ui-verify` skill; `grok mcp doctor playwright`
- **Gate:** `bash scripts/check_coverage.sh` (CI + `npm run validate`)
- One concern per test; name describes behavior
- No live network/external APIs in CI unless explicitly marked integration
- Fix application code, not tests, when requirement is stable

## Layout

| Pattern | Purpose |
|---------|---------|
| `src/lib/*.test.ts` | Unit tests (colocated) |
| `e2e/*.spec.ts` | Browser smoke / user flows |
| `test_contracts_*.ts` | Schema / interface contract tests (add per project) |

## Verification status

| Claim | Status |
|-------|--------|
| TDD: failing test before implementation | VERIFIED — process |
| CI runs unit + e2e suite | VERIFIED — `.github/workflows/ci.yml` |
| Coverage ≥ 90% on `src/lib/` | VERIFIED — Vitest thresholds |

## Do not

- Skip failing-test step for T1+ work
- Weaken tests to match incorrect implementation without plan update
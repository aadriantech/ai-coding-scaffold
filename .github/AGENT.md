# AGENT — CI/CD

**Scope:** GitHub Actions, PR/issue templates, release automation.  
**Owns:** `.github/**`  
**Depends on:** TST, ROOT  
**Last verified:** 2026-07-01 · Vitest + Playwright CI

## Workflows

| File | Purpose |
|------|---------|
| `workflows/ci.yml` | Agent memory check + unit coverage (≥90%) + Playwright e2e |

## Gates

- `scripts/check_agent_sync.sh` in CI
- `scripts/check_coverage.sh` — Vitest ≥90% on `src/lib/`
- `npm run test:e2e` — Playwright against `demo/`
- T2+ PRs: critic `recommendation: approve` in `reviews/`

## PR requirements

- AYSU block in description (see `pull_request_template.md`)
- T2+: link `reviews/<task-id>.md`

## Do not

- Disable agent-sync workflow without updating AGENT_INDEX sync policy
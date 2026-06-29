# AGENT — CI/CD

**Scope:** GitHub Actions, PR/issue templates, release automation.  
**Owns:** `.github/**`  
**Depends on:** TST, ROOT  
**Last verified:** YYYY-MM-DD · baseline

## Workflows

| File | Purpose |
|------|---------|
| `workflows/ci.yml` | Agent memory check + <!-- CUSTOMIZE: test suite --> |

## Gates

- `scripts/check_agent_sync.sh` in CI
- Test suite green
- T2+ PRs: critic `recommendation: approve` in `reviews/`

## PR requirements

- AYSU block in description (see `pull_request_template.md`)
- T2+: link `reviews/<task-id>.md`

## Do not

- Disable agent-sync workflow without updating AGENT_INDEX sync policy
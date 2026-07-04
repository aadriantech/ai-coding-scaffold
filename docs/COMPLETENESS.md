# Scaffold completeness checklist

Self-audit for whether a project has full agent infrastructure.  
Based on [AstroSim](https://github.com/aadriantech/astrosim) production experience.

## Tier 0 — Minimum (start coding)

- [ ] `AGENTS.md`
- [ ] `AGENT_INDEX.md`
- [ ] `docs/plans/TEMPLATE.md`
- [ ] `.grok/skills/pdd-plan/` (or equivalent)

## Tier 1 — Solo developer (recommended)

- [ ] Core skills (pdd, tdd, ui-verify, cdd, aysu, memory-sync, scaffold-init)
- [ ] Loop skills (reflexion, error-sync) — v1.4+
- [ ] `docs/METHODOLOGY.md`, `docs/LOOP_PATTERNS.md`
- [ ] `docs/errors/INDEX.md`, `docs/patterns/SUCCESS.md`
- [ ] `contracts/critic_review.schema.md`
- [ ] `scripts/check_agent_sync.sh`
- [ ] `reviews/` directory

## Tier 2 — Team / PR workflow

- [ ] `CONTRIBUTING.md`
- [ ] `.github/pull_request_template.md`
- [ ] `.github/workflows/ci.yml` (agent memory + tests)
- [ ] `tests/AGENT.md`, `.github/AGENT.md`
- [ ] `docs/PRD.md`, `docs/SRD.md`, `docs/TASKLIST.md`
- [ ] `reviews/TEMPLATE.md`

## Tier 3 — Production parity (AstroSim-level)

- [x] `.github/workflows/ci.yml` with real test suite
- [ ] `scripts/integrity_check.sh` extended
- [ ] Per-module `src/*/AGENT.md` + AGENT_INDEX rows
- [ ] `contracts/*.schema.json` + `test_contracts_*.py`
- [ ] `docs/ROADMAP.md` phase tracking
- [ ] Issue templates
- [ ] `CLAUDE.md` / `.cursor/rules/` for multi-tool
- [x] Coverage gate in CI (`scripts/check_coverage.sh`, ≥90%)

## This repo (ai-coding-scaffold)

| Tier | Status |
|------|--------|
| 0 | ✅ Complete |
| 1 | ✅ Complete |
| 2 | ✅ Complete |
| 3 | ✅ Complete in-repo; monorepos customize via `docs/CUSTOMIZE_MONOREPO.md` |

## Gaps intentionally left to each project

- Application source code and tests
- Domain-specific JSON schemas
- Smoke scripts and benchmarks
- Release/PyPI/docs publish workflows
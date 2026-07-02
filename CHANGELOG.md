# Changelog

## [1.3.3] - 2026-07-02

### Added

- **Grok MCP Playwright** — `.grok/config.toml` with `--caps=vision` + `playwright-mcp-output/`
- **`/ui-verify` skill** — MCP browse, snapshot, screenshot workflow before human validation
- `docs/MCP_UI_VALIDATION.md` — setup, Grok prompts, two-layer testing (MCP + npm e2e)

## [1.3.2] - 2026-07-02

### Added

- `docs/TASKLIST.md` template — phased granular backlog with `1.1.1.1` IDs, linked from PRD/SRD/plans
- Tier 2 completeness now includes `TASKLIST.md` once SRD has real requirements

## [1.3.1] - 2026-07-02

### Added

- `docs/CUSTOMIZE_MONOREPO.md` — adapt `check_agent_sync.sh`, `AGENT_INDEX`, and CI for `apps/*` layout ([Astroforge](https://github.com/aadriantech/astroforge) reference)
- **4-level implementation tasks** (`1.1.1.1`) in plan template, epic example, `pdd-plan` and `tdd-implement` skills, and `METHODOLOGY.md`
- `self_test.sh` now runs `npm ci` + coverage on bootstrapped temp dir

### Changed

- `scaffold_init.sh` copies `CUSTOMIZE_MONOREPO.md`; post-bootstrap hints include `npm run validate`
- `check_coverage.sh` exports Node PATH for CI/local parity

## [1.3.0] - 2026-07-01

### Added

- **Vitest** unit tests on demo `src/lib/` (`greet`, `slugify`) with **≥90% coverage** gate
- **Playwright** e2e tests against `demo/index.html`
- `scripts/check_coverage.sh`, `npm run validate`
- `package.json`, `vitest.config.ts`, `playwright.config.ts`, `tsconfig.json`
- CI `test` job: coverage + Playwright (Chromium)
- `scaffold_init.sh` copies test toolchain + demo sources

## [1.2.2] - 2026-06-29

### Added

- `docs/SHARE.md` — copy-paste promotion pack (X, Reddit, HN, LinkedIn)

## [1.2.1] - 2026-06-29

### Added

- `docs/DECISIONS.md` — RALF vs gated workflow (ADR-001), future policy-driven autonomous loop (ADR-002)

## [1.2.0] - 2026-06-29

### Added

- `docs/QUICKSTART.md` — 5-minute bootstrap + first epic walkthrough
- `docs/CASE_STUDY_ASTROSIM.md` — 16-phase proof with live AstroSim links
- `docs/COMPARE.md` — honest comparison vs spec-kit, BMAD, ad hoc rules
- Annotated `docs/plans/epic-example.md` with section "Why" guides
- `reviews/example-approved.md` — sample critic output

## [1.1.0] - 2026-06-29

### Added

- `CONTRIBUTING.md`, `docs/ADOPTION.md`, `docs/PRD.md`, `docs/SRD.md`, `docs/ROADMAP.md`
- `tests/AGENT.md`, `.github/AGENT.md`, `src/AGENT.md` starter stubs
- `.github/pull_request_template.md` with AYSU block
- `.github/workflows/agent-sync.yml` and `ci.yml` template
- `.github/ISSUE_TEMPLATE/` feature + bug
- `reviews/TEMPLATE.md`, `docs/plans/epic-example.md`
- `scripts/integrity_check.sh` template
- `contracts/api.schema.template.json`
- `CLAUDE.md`, `.cursor/rules/ai-coding.mdc`
- Expanded `check_agent_sync.sh` coverage

## [1.0.0] - 2026-06-29

### Added

- PDD→TDD→CDD→AYSU pipeline and six Grok skills
- `AGENTS.md`, `AGENT_INDEX.md`, `AGENT_TEMPLATE.md`
- `docs/METHODOLOGY.md`, plan and critic review templates
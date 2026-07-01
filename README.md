# AI Coding Scaffold

[![CI](https://github.com/aadriantech/ai-coding-scaffold/actions/workflows/ci.yml/badge.svg)](https://github.com/aadriantech/ai-coding-scaffold/actions/workflows/ci.yml)

Portable **plan-before-code** infrastructure for Grok, Cursor, Claude Code, or any agentic IDE.

**Version 1.3.0** — Vitest unit tests (≥90% coverage) + Playwright e2e, enforced in CI.

## How we built [AstroSim](https://github.com/aadriantech/astrosim) with this

This scaffold is not theory — it is the **exact workflow** used to build [AstroSim](https://github.com/aadriantech/astrosim), an open-source space habitat simulator, from zero to **v1.2.0** (16 phases, 183 tests, public repo + docs site).

Every AstroSim feature followed the same loop:

```
/pdd-plan  →  docs/plans/epic-phaseN.md   (numbered acceptance criteria)
/tdd-implement  →  failing tests first, then src/
/cdd-review  →  reviews/epic-phaseN.md    (critic approve before ship)
/aysu-verify  →  confidence: high
/memory-sync  →  section AGENT.md updated
```

**What that produced in AstroSim:**

| Artifact | AstroSim example |
|----------|------------------|
| Plans before code | `docs/plans/epic-phase16.md` (reference validation) |
| Distributed memory | 15 section `AGENT.md` files + `AGENT_INDEX.md` |
| Contracts | 11 JSON schemas in `contracts/` |
| Critic reviews | `reviews/epic-phase16.md` |
| Grok skills | `.grok/skills/pdd-plan`, `tdd-implement`, etc. |
| CI enforcement | `check_agent_sync.sh` + Vitest coverage gate + Playwright in GitHub Actions |

AstroSim grew the scaffold to **Tier 3** (per-module memory, contract tests, coverage gates). This repo gives you **Tier 0–2 out of the box** plus Tier 3 templates — copy it, then extend as your project matures.

**Pipeline:** **PDD → TDD → CDD → AYSU** — no plan → no code.

## Quick start

→ **[docs/QUICKSTART.md](docs/QUICKSTART.md)** (full walkthrough)

```bash
git clone git@github.com:aadriantech/ai-coding-scaffold.git /tmp/scaffold
cd your-project
bash /tmp/scaffold/scripts/scaffold_init.sh .
bash scripts/check_agent_sync.sh
/pdd-plan   # first epic
```

Or in Grok: **`/scaffold-init`**

## Pipeline

```
PDD (plan) → TDD (implement) → CDD (review) → AYSU (verify)
```

**Gates:** No plan → no code · No green tests → no CDD · No approve → no ship

## What's included

| Category | Files |
|----------|-------|
| **Core** | `AGENTS.md`, `AGENT_INDEX.md`, `AGENT_TEMPLATE.md`, `CONTRIBUTING.md` |
| **Specs** | `docs/PRD.md`, `docs/SRD.md`, `docs/ROADMAP.md` |
| **Plans** | `docs/plans/TEMPLATE.md`, `docs/plans/epic-example.md` |
| **Reviews** | `reviews/TEMPLATE.md`, `contracts/critic_review.schema.md` |
| **Memory stubs** | `src/AGENT.md`, `tests/AGENT.md`, `.github/AGENT.md` |
| **Enforcement** | `.github/pull_request_template.md`, `.github/workflows/ci.yml` |
| **Issues** | `.github/ISSUE_TEMPLATE/` |
| **Tests** | Vitest (`src/lib/*.test.ts`), Playwright (`e2e/`), `demo/` static page |
| **Scripts** | `check_agent_sync.sh`, `check_coverage.sh`, `integrity_check.sh`, `scaffold_init.sh` |
| **Multi-tool** | `CLAUDE.md`, `.cursor/rules/ai-coding.mdc` |
| **Skills** | `.grok/skills/` — pdd-plan, tdd-implement, cdd-review, aysu-verify, memory-sync, scaffold-init |

## Skills

| Skill | Trigger |
|-------|---------|
| `pdd-plan` | `/pdd-plan` — write plan before code |
| `tdd-implement` | `/tdd-implement` — tests first |
| `cdd-review` | `/cdd-review` — adversarial review |
| `aysu-verify` | `/aysu-verify` — done gate |
| `memory-sync` | `/memory-sync` — update section AGENT.md |
| `scaffold-init` | `/scaffold-init` — bootstrap repo |

## Documentation

| Doc | Description |
|-----|-------------|
| **[QUICKSTART.md](docs/QUICKSTART.md)** | **Start here** — 5 min bootstrap + first epic |
| [CASE_STUDY_ASTROSIM.md](docs/CASE_STUDY_ASTROSIM.md) | How AstroSim was built (16 phases, live links) |
| [COMPARE.md](docs/COMPARE.md) | vs spec-kit, BMAD, ad hoc Cursor rules |
| [DECISIONS.md](docs/DECISIONS.md) | RALF vs gated workflow; future autonomous loop |
| [SHARE.md](docs/SHARE.md) | Copy-paste posts for X, Reddit, HN, LinkedIn |
| [METHODOLOGY.md](docs/METHODOLOGY.md) | Full PDD/TDD/CDD/AYSU reference |
| [ADOPTION.md](docs/ADOPTION.md) | First-hour setup checklist |
| [COMPLETENESS.md](docs/COMPLETENESS.md) | Tier 0–3 self-audit vs AstroSim |
| [CHANGELOG.md](CHANGELOG.md) | Release history |

## Completeness tiers

| Tier | For | Status in this repo |
|------|-----|---------------------|
| 0 | Minimum viable agent workflow | ✅ |
| 1 | Solo developer | ✅ |
| 2 | Team + PR workflow | ✅ |
| 3 | Production (per-module memory, contracts, coverage) | ✅ Coverage + e2e in CI; extend per project |

See [docs/COMPLETENESS.md](docs/COMPLETENESS.md) for full checklist.

## Tool portability

| Tool | Entry file |
|------|------------|
| Grok | `AGENTS.md` + `.grok/skills/` |
| Cursor | `.cursor/rules/ai-coding.mdc` |
| Claude Code | `CLAUDE.md` |

## License

MIT
# AI Coding Scaffold

[![CI](https://github.com/aadriantech/ai-coding-scaffold/actions/workflows/ci.yml/badge.svg)](https://github.com/aadriantech/ai-coding-scaffold/actions/workflows/ci.yml)

Portable **plan-before-code** infrastructure for Grok, Cursor, Claude Code, or any agentic IDE.

Derived from [AstroSim](https://github.com/aadriantech/astrosim): **PDD → TDD → CDD → AYSU**.

**Version 1.1.0** — team-ready with PR templates, CI gate, adoption guide.

## Quick start

```bash
# Bootstrap into your project
git clone git@github.com:aadriantech/ai-coding-scaffold.git /tmp/scaffold
cd your-project
bash /tmp/scaffold/scripts/scaffold_init.sh .
# Customize docs/PRD.md, AGENTS.md, .github/workflows/ci.yml
bash scripts/check_agent_sync.sh
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
| **Scripts** | `check_agent_sync.sh`, `integrity_check.sh`, `scaffold_init.sh` |
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
| 3 | Production (per-module memory, contracts, coverage) | Templates + CUSTOMIZE stubs |

See [docs/COMPLETENESS.md](docs/COMPLETENESS.md) for full checklist.

## Tool portability

| Tool | Entry file |
|------|------------|
| Grok | `AGENTS.md` + `.grok/skills/` |
| Cursor | `.cursor/rules/ai-coding.mdc` |
| Claude Code | `CLAUDE.md` |

## License

MIT
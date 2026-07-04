# AGENT_INDEX

> **Read this first** to route context. Load only listed section files.

**Last synced:** 2026-07-03
**Sync policy:** Run `scripts/check_agent_sync.sh` after adding domains

| ID | Domain | Path | Load when… |
|----|--------|------|------------|
| ROOT | Operating rules | [AGENTS.md](AGENTS.md) | Every new session |
| PKG | Package / app entry | [src/AGENT.md](src/AGENT.md) | Public API, CLI |
| TST | Tests | [tests/AGENT.md](tests/AGENT.md) | TDD, coverage |
| CIC | CI/CD | [.github/AGENT.md](.github/AGENT.md) | Workflows, release |
| CON | Contracts | [contracts/README.md](contracts/README.md) | Schemas, API shapes |
| LOOP | Loop patterns | [docs/LOOP_PATTERNS.md](docs/LOOP_PATTERNS.md) | Scaffold design, RALF v2, reflexion |
| ERR | Error library | [docs/errors/INDEX.md](docs/errors/INDEX.md) | Repeated failure classes |

<!-- ADD ROWS as domains grow. Example:
| ENG | Core engine | src/engine/AGENT.md | Core logic, state |
-->

## Load combinations

| Work type | Primary | Secondary (max 2) |
|-----------|---------|-------------------|
| New feature | PKG | TST, CON |
| Bugfix | _domain_ | TST |
| CI / release | CIC | TST, ROOT |
| Scaffold / methodology | ROOT | LOOP |
| Loop-back / failed gate | ROOT | ERR |
| Docs only | ROOT | — |
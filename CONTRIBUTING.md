# Contributing

Development follows **PDD → TDD → CDD → AYSU**. Read [AGENTS.md](AGENTS.md) and [AGENT_INDEX.md](AGENT_INDEX.md) before coding.

## Prerequisites

```bash
git clone <your-repo>
cd <your-repo>
# install dev dependencies per project README
```

## Workflow

| Step | Skill | Output |
|------|-------|--------|
| **PDD** | `/pdd-plan` | `docs/plans/<epic>.md` |
| **TDD** | `/tdd-implement` | failing tests → green code |
| **CDD** | `/cdd-review` | `reviews/<task-id>.md` |
| **AYSU** | `/aysu-verify` | structured verification block |

### Task classes

| Class | Pipeline |
|-------|----------|
| T0 typo/docs | TDD → AYSU |
| T1 single module | Light PDD → TDD → AYSU |
| T2 cross-module | Full PDD → TDD → CDD → AYSU |
| T3 release/infra | Full + human sign-off |

## Memory protocol

1. Read `AGENT_INDEX.md`
2. Load **one** primary section `AGENT.md` (+ up to 2 secondary)
3. After behavior changes: `/memory-sync`

Section template: [AGENT_TEMPLATE.md](AGENT_TEMPLATE.md)

## Verification

```bash
bash scripts/check_agent_sync.sh
npm ci
npm run validate   # >= 90% unit coverage + Playwright e2e
bash scripts/integrity_check.sh   # pre-release gate
```

## Pull requests

Use the PR template (`.github/pull_request_template.md`). T2+ requires critic `recommendation: approve`.

## Plans and reviews

- Plans: `docs/plans/<epic>.md` — set `status: ready` before implementation
- Reviews: `reviews/<task-id>.md` — per `contracts/critic_review.schema.md`

## First-time setup

See [docs/ADOPTION.md](docs/ADOPTION.md).

## Sharing this project

Copy-paste posts for X, Reddit, Hacker News, LinkedIn: [docs/SHARE.md](docs/SHARE.md).
# AI Coding Scaffold

Portable **plan-before-code** infrastructure for Grok, Cursor, Claude Code, or any agentic IDE.

Derived from the [AstroSim](https://github.com/aadriantech/astrosim) methodology: **PDD → TDD → CDD → AYSU**.

## The pipeline

```
User request
    ↓
PDD (plan)          docs/plans/<epic>.md + numbered acceptance criteria
    ↓
TDD (implement)     failing test → green code → refactor
    ↓
CDD (review)        reviews/<task-id>.md — 0 critical/high to approve
    ↓
AYSU (verify)       structured confidence block before "done"
```

**Gate rule:** No plan → no code. No green tests → no review. No approve → no ship.

## Task classes

| Class | When | Pipeline |
|-------|------|----------|
| **T0** | Typo, comment, docs only | TDD (if tests touched) → AYSU |
| **T1** | Single module, clear spec | Light PDD → TDD → AYSU |
| **T2** | Cross-module, API, contracts | Full PDD → TDD → CDD → AYSU |
| **T3** | Release, CI, architecture | Full + human sign-off |

Default unknown tasks to **T2**.

## Memory model (why agents don't drown in context)

| Layer | File | Purpose |
|-------|------|---------|
| Operating manual | `AGENTS.md` | Methodology, gates, conventions — read every session |
| Router | `AGENT_INDEX.md` | Which section `AGENT.md` to load for which work |
| Section memory | `**/AGENT.md` | Domain gotchas, VERIFIED claims, test pointers |
| Interfaces | `contracts/` | Canonical schemas — section files link, never duplicate |
| Plans | `docs/plans/` | Epics before implementation |
| Reviews | `reviews/` | Critic output |

**Load protocol:** `AGENT_INDEX` → `AGENTS.md` → **one** primary section `AGENT.md` (+ max 2 secondary). Never load all section files.

## Quick start (new repo)

```bash
# From your project root:
cp -r /path/to/ai-coding-scaffold/.grok ./
cp AGENTS.md AGENT_INDEX.md AGENT_TEMPLATE.md ./
mkdir -p docs/plans contracts reviews scripts
cp docs/plans/TEMPLATE.md docs/plans/
cp contracts/critic_review.schema.md contracts/
cp scripts/check_agent_sync.sh scripts/ && chmod +x scripts/check_agent_sync.sh

# Customize AGENT_INDEX.md for your domains
# Add section AGENT.md files as you create modules
bash scripts/check_agent_sync.sh
```

## Grok skills (slash commands)

| Skill | Trigger | Output |
|-------|---------|--------|
| `pdd-plan` | `/pdd-plan`, new feature | `docs/plans/<epic>.md` |
| `tdd-implement` | `/tdd-implement`, after plan ready | `src/` + `tests/` |
| `cdd-review` | `/cdd-review`, after tests green | `reviews/<id>.md` |
| `aysu-verify` | `/aysu-verify`, before done | AYSU block |
| `memory-sync` | `/memory-sync`, after behavior change | Updated section AGENT.md |
| `scaffold-init` | `/scaffold-init`, new repo | Copies templates into cwd |

Skills live in `.grok/skills/<name>/SKILL.md` (project) or `~/.grok/skills/` (global).

## Tool portability

| Piece | Grok | Cursor | Claude Code |
|-------|------|--------|-------------|
| `AGENTS.md` | Auto-read via rules | `.cursorrules` or `AGENTS.md` | `CLAUDE.md` / `AGENTS.md` |
| Skills | `.grok/skills/` | Cursor rules / commands | `.claude/skills/` or prompts |
| Plans / reviews | Same files on disk | Same | Same |
| Contracts | Same | Same | Same |

The **files are the product** — skills are thin wrappers that tell the agent which files to read and in what order.

## What AstroSim added on top (optional for your project)

- `contracts/*.schema.json` — JSON Schema for exports/APIs
- Per-domain `AGENT.md` in every `src/` subtree
- `scripts/check_agent_sync.sh` — CI gate for memory files
- Task class T3 for releases

Start minimal: `AGENTS.md` + `AGENT_INDEX.md` + `docs/plans/TEMPLATE.md` + one `pdd-plan` skill.

## Documentation

| Doc | Description |
|-----|-------------|
| [METHODOLOGY.md](docs/METHODOLOGY.md) | Full reference: PDD, TDD, CDD, AYSU, skills, memory, indexing |

## License

MIT — copy freely into your projects.
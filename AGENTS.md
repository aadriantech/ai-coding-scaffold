# Agent Operating Manual

**Scope:** How AI agents work in this repo. Domain knowledge lives in section `AGENT.md` files.

## Methodology (strict order)

| Step | Name | Artifact | Gate |
|------|------|----------|------|
| 1 | **PDD** | `docs/plans/<epic>.md` | Plan complete; acceptance criteria numbered; implementation tasks at `1.1.1.1` depth |
| 2 | **TDD** | `tests/` | Failing test first → green → refactor |
| 3 | **CDD** | `reviews/<task-id>.md` | 0 open critical/high findings |
| 4 | **AYSU** | PR / session summary | Structured block; confidence = high |

**No plan → no code. No green tests → no CDD. No CDD approve → no AYSU.**

Invoke skills: `/pdd-plan` → `/tdd-implement` → `/cdd-review` → `/aysu-verify`

**RALF Loop is retired** in favor of this gated workflow. Rationale and future autonomous policy: [docs/DECISIONS.md](docs/DECISIONS.md).

## Task classes

| Class | When | Pipeline |
|-------|------|----------|
| **T0** | Typo, comment, pure docs | TDD (if tests touched) → AYSU |
| **T1** | Single module, clear spec | Light PDD → TDD → AYSU |
| **T2** | Cross-module, API, contracts | Full PDD → TDD → CDD → AYSU |
| **T3** | Release, CI, architecture | Full pipeline + human sign-off |

Default unknown tasks to **T2**.

## Memory read protocol

1. Read **`AGENT_INDEX.md`** (domain routing).
2. Read **this file** if new session or methodology unclear.
3. Load **primary** section `AGENT.md` (+ up to **2 secondary** per index).
4. Load **`contracts/`** only when touching interfaces or schemas.
5. **Never** load all section files in one session.

## Sub-agents / roles

| Role | Skill | Produces | Must not |
|------|-------|----------|----------|
| Planner | `pdd-plan` | `docs/plans/<epic>.md` | Code, tests |
| Implementer | `tdd-implement` | `src/` + `tests/` | Skip tests, expand scope |
| Critic | `cdd-review` | `reviews/<id>.md` | Implement fixes |
| Verifier | `aysu-verify` | AYSU block | Ship on low confidence |

## Stack conventions

<!-- CUSTOMIZE: replace demo lib when your app grows -->
- **Language:** TypeScript 6.x, `src/lib/` layout (demo utilities — swap for your stack)
- **Unit tests:** Vitest — `npm test`, `npm run test:coverage` (≥90% on `src/lib/`)
- **E2E:** Playwright — `npm run test:e2e` (serves `demo/` locally)
- **Validate:** `npm run validate` (coverage gate + e2e)
- Fix `src/`, not tests, when requirements are stable

## AYSU checklist (required before done)

```
AYSU:
  confidence: high | medium | low
  task_class: T0 | T1 | T2 | T3
  verified:
    - [ ] Plan acceptance criteria met
    - [ ] Tests green
    - [ ] Critic approve (T2+)
    - [ ] Section AGENT.md updated if behavior changed
  residual_risks: <list or "none">
  loop_back: no
```

## Related

- Index: [AGENT_INDEX.md](AGENT_INDEX.md)
- Contributing: [CONTRIBUTING.md](CONTRIBUTING.md)
- Adoption: [docs/ADOPTION.md](docs/ADOPTION.md)
- Completeness: [docs/COMPLETENESS.md](docs/COMPLETENESS.md)
- Section template: [AGENT_TEMPLATE.md](AGENT_TEMPLATE.md)
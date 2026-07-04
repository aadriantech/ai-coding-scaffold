# Loop design patterns × AI scaffold

**Source:** [Rahul — 20 Loop Design Patterns Every AI Engineer Should Know](https://x.com/sairahul1/status/2072258045460226373) (July 2026)  
**Unified formula:** Act → Observe → Evaluate → Adjust

Maps Rahul's patterns to this scaffold's gated pipeline (`PDD → TDD → UI → CDD → AYSU`) and lists upgrades shipped or planned here.

---

## What this scaffold already implements

| # | Pattern | Scaffold equivalent | Artifact |
|---|---------|---------------------|----------|
| 1 | Generate → Critique → Rewrite | `tdd-implement` + `cdd-review` (separate roles) | `src/` + `reviews/<id>.md` |
| 4 | Adversarial critique | CDD skill — break the diff, not polish it | `reviews/*.md` |
| 5 | Judge ensemble (partial) | Human + AYSU + CI | `.github/workflows/ci.yml` |
| 11 | Plan → Execute → Replan | PDD + optional `execute-plan` DAG | `docs/plans/<epic>.md` |
| 13 | Goal decomposition | Numbered acceptance criteria | plan template |
| 15 | Constraint satisfaction | Hard gates in `AGENTS.md` | skills |
| 18 | Debate (partial) | Critic must not implement | role table in `AGENTS.md` |

**Case study:** [Astroforge](https://github.com/aadriantech/astroforge) — 28 Playwright, CDD approve, AYSU high on epic `tasklist-completion`.

---

## Shipped in scaffold v1.4

| # | Pattern | Addition |
|---|---------|----------|
| 3 | Multi-critic | Four lenses in `reviews/TEMPLATE.md`: correctness · security · a11y · contracts |
| 6 | Reflexion | `/reflexion` skill → `reviews/<id>-reflection.md` before retry |
| 8 | Error library | `docs/errors/INDEX.md` — session mistakes as one-liners |
| 9 | Success patterns | `docs/patterns/SUCCESS.md` — proven fix combos |
| 20 | Workflow metrics (partial) | Optional `attempts` / `loop_back_count` in AYSU block |

---

## Recommended next (RALF v2 / Tier 3+)

| # | Pattern | Proposed |
|---|---------|----------|
| 2 | Score-and-retry | Single `npm run validate` score; block epic if below threshold |
| 10 | Memory compression | `scripts/compress_reviews.py` → fold findings into `DECISIONS.md` |
| 14 | Progress evaluation | Plan template checkpoint every N criteria |
| 16 | Branch-and-explore | Document `best-of-n-runner` for T2 UI in `METHODOLOGY.md` |
| 19 | Prompt optimization | `reviews/skill-changelog.md` when humans edit skills after failures |

RALF v2 (`DECISIONS.md`) must use **constraint satisfaction (#15)** via CI gates, not model confidence alone.

---

## Retired RALF → loop-native gates

| Old RALF | Loop pattern | Current gate |
|----------|--------------|--------------|
| Requirements | Goal decomposition (#13) | **PDD** |
| Assert | Score-and-retry (#2) | **TDD** |
| Launch | Generate (#1) | **TDD** implement |
| Feedback | Reflexion (#6) + Memory (#7) | **CDD** + **AYSU** + `/reflexion` |

---

## Related

- [METHODOLOGY.md](METHODOLOGY.md) · [DECISIONS.md](DECISIONS.md) · [COMPLETENESS.md](COMPLETENESS.md)
- [Karpathy LOOPS.md notes](https://tonybai.com/2026/07/02/loops-md-notes-on-agents-that-run-for-days)
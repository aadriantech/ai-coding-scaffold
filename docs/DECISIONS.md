# Architecture decisions

Key methodology choices from building [AstroSim](https://github.com/aadriantech/astrosim). Short reference for contributors and agents.

---

## ADR-001: Retire RALF Loop → gated PDD→TDD→CDD→AYSU

**Status:** Accepted (2026-06-29)  
**Replaces:** RALF Loop (`Requirements → Assert → Launch → Feedback` as one autonomous cycle)

### Context

Early AstroSim used **RALF Loop** — the agent planned, implemented, and self-declared completion in a continuous loop until "done." It shipped features fast but was hard to trust at scale.

### Decision

Retire RALF. Adopt **four explicit gates**:

```
PDD (plan) → TDD (implement) → CDD (review) → AYSU (verify)
```

| Gate | Artifact | Rule |
|------|----------|------|
| PDD | `docs/plans/<epic>.md` | No plan → no code |
| TDD | `tests/` | Failing test first → green suite |
| CDD | `reviews/<id>.md` | 0 critical/high → approve |
| AYSU | confidence block | Not done until `confidence: high` |

### What we observed (RALF risks)

| Risk | What happened |
|------|----------------|
| Scope creep | Agent implemented beyond the ask without a frozen plan |
| Self-review | Same agent judged its own work — blind spots stayed |
| Untested "done" | Green claimed without mapping criteria → tests |
| Context bloat | Long loops re-read everything; quality dropped |
| Non-replayable | Hard to audit *why* a change shipped |

### What worked (gated workflow on AstroSim)

- **16 phases**, **183 tests**, v0.1.0 → v1.2.0, public repo
- Numbered acceptance criteria mapped to named tests
- Separate **critic** role (CDD) caught plan drift and missing coverage
- **AYSU** blocked premature "ship" declarations
- **AGENT_INDEX** limited context to 1–3 domain files per session

Historical RALF mapping:

| RALF | Gated equivalent |
|------|------------------|
| Requirements | **PDD** |
| Assert | **TDD** (failing test) |
| Launch | **TDD** (implement) |
| Feedback | **CDD** + **AYSU** |

AstroSim: [`.grok/skills/ralf-loop/DEPRECATED.md`](https://github.com/aadriantech/astrosim/blob/main/.grok/skills/ralf-loop/DEPRECATED.md)

---

## ADR-002: Future — policy-driven autonomous loop (RALF v2)

**Status:** Proposed — not implemented  
**Goal:** Earn autonomy back **without** losing auditability

We do **not** want infinite "keep going until done." We want **tiered auto-apply** with the same artifacts as today.

### Policy tiers

| Task class | Autonomy | Gates required |
|------------|----------|----------------|
| **T0** | Auto-apply allowed | Tests green (if touched) + AYSU high |
| **T1** | Auto-apply after plan | Light PDD + TDD + AYSU high |
| **T2** | Human or proven bot | Full PDD + TDD + CDD approve + AYSU high |
| **T3** | Human sign-off | Full pipeline + release checklist |

### Conditions for autonomous apply (all must pass)

1. Plan exists with numbered criteria (`status: ready`)
2. Failing test written first, full suite green
3. CDD `recommendation: approve` (T2+) or skipped (T0/T1 only)
4. AYSU `confidence: high` and `loop_back: no`
5. No edits outside plan interfaces / out of scope
6. `check_agent_sync` + contracts pass (if interfaces touched)

### Proposed loop (future skill: `ralf-v2` or `autonomous-tier`)

```
while epic_open:
    classify task → T0|T1|T2|T3
    PDD (skip or light for T0/T1)
    TDD
    CDD if T2+
    AYSU
    if tier allows and all gates pass:
        auto-commit / auto-PR
    else:
        stop → human approval
    memory-sync
```

### What we need before turning this on

| Prerequisite | Purpose |
|--------------|---------|
| Track record | N consecutive T1 epics: plan → tests → AYSU high, zero rework |
| Automated tier classifier | Agent proposes T-class; human overrides until trusted |
| Diff scope check | CI fails if changed files ∉ plan interfaces |
| Streak counter | e.g. 10 green auto-T0 runs before expanding to T1 auto-apply |
| Rollback | One-command revert for auto-applied commits |

### Explicit non-goals for v2

- No auto-apply on T2/T3 until human opt-in per repo
- No skipping tests "because confident"
- No merging CDD into implementer — critic stays separate
- No replacing AYSU with model self-assessment alone

---

## ADR-003: Distributed memory (AGENT_INDEX)

**Status:** Accepted

One giant prompt file does not scale. Route via `AGENT_INDEX.md` → load **one** primary `AGENT.md` (+ max 2 secondary). Contracts live in `contracts/`; section memory links only.

---

## ADR-004: Files are the product; skills are thin

**Status:** Accepted

Plans, reviews, and AGENT.md files are versioned truth. Grok/Cursor/Claude skills only say *which files to read and in what order*.

---

## ADR-005: Loop patterns as scaffold evolution map

**Status:** Accepted (v1.4)  
**Source:** [Rahul — 20 Loop Design Patterns](https://x.com/sairahul1/status/2072258045460226373) (July 2026)

### Decision

1. Map external loop taxonomy in [LOOP_PATTERNS.md](LOOP_PATTERNS.md).
2. Ship memory loops as files: `docs/errors/INDEX.md`, `docs/patterns/SUCCESS.md`.
3. Add `/reflexion` and `/error-sync` skills; multi-critic lenses in CDD template.
4. RALF v2 auto-apply requires CI constraint satisfaction (#15), not model confidence.

### Shipped (v1.4)

- `reflexion`, `error-sync` skills
- Multi-critic `reviews/TEMPLATE.md`
- Optional AYSU `attempts` / `loop_back_count`

---

## Related

- [METHODOLOGY.md](METHODOLOGY.md) — pipeline reference
- [LOOP_PATTERNS.md](LOOP_PATTERNS.md) — 20 patterns × scaffold
- [CASE_STUDY_ASTROSIM.md](CASE_STUDY_ASTROSIM.md) — proof on real project
- [COMPARE.md](COMPARE.md) — vs spec-kit, BMAD
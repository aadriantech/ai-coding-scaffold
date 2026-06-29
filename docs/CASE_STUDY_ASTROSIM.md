# Case study: Building AstroSim with this workflow

[AstroSim](https://github.com/aadriantech/astrosim) is an open-source space habitat simulator. It was built entirely with **PDD → TDD → CDD → AYSU** — the workflow this scaffold packages.

**Result:** v0.1.0 → **v1.2.0** · 16 phases · **183 tests** · public repo · [docs site](https://aadriantech.github.io/astrosim/)

---

## Timeline (phases → versions)

| Phases | Version | Theme |
|--------|---------|-------|
| 1–5 | 0.1.0 | MVP core, subsystems, contracts |
| 6–8 | 0.2–0.4 | Growth, CI, production hardening |
| 9–11 | 0.5–0.7 | Study exports, suite, Monte Carlo compare |
| 12–14 | 0.8–1.0 | PyPI-ready, v1.0 completion |
| 15 | 1.1.0 | Dynamic version, parallel suite |
| 16 | 1.2.0 | NASA benchmark validation, interpretation v2 |

Each phase = one PDD plan → TDD implementation → CDD review (T2+) → AYSU → memory-sync.

---

## What the scaffold produced in AstroSim

| Scaffold piece | AstroSim artifact | Count |
|----------------|-------------------|-------|
| Plans | `docs/plans/epic-phase*.md` | 16+ epics |
| Reviews | `reviews/epic-*.md` | Per T2+ phase |
| Index | `AGENT_INDEX.md` | 15 domains |
| Section memory | `**/AGENT.md` | 15 files |
| Contracts | `contracts/*.schema.json` | 11 schemas |
| Skills | `.grok/skills/` | 5 active (+ deprecated ralf-loop) |
| CI gate | `check_agent_sync.sh` + pytest | Every push |
| PR discipline | `pull_request_template.md` + AYSU | Every merge |

---

## Worked example: Phase 16 (v1.2.0)

**Goal:** Reference validation against NASA BVAD/OCHMO + richer study reports.

### 1. PDD — plan before code

Live plan: [astrosim/docs/plans/epic-phase16.md](https://github.com/aadriantech/astrosim/blob/main/docs/plans/epic-phase16.md)

- **10 numbered acceptance criteria** (testable)
- Interfaces table listing every new file
- Explicit out of scope (no PDF parsing, no LLM validation)
- `status: ready` before any `src/` edits

### 2. TDD — tests first

- Wrote `test_reference_validation.py`, `test_interpretation_v2.py` **before** implementation
- Confirmed failures for right reason (`ModuleNotFoundError: validation`)
- Implemented `src/astrosim/validation/`, updated interpretation + CLI
- **183 tests green**

### 3. CDD — critic review

Live review: [astrosim/reviews/epic-phase16.md](https://github.com/aadriantech/astrosim/blob/main/reviews/epic-phase16.md)

- Score: 9/10
- 1 low finding (envelope name heuristics)
- **`recommendation: approve`** — zero critical/high

### 4. AYSU — ship gate

```
AYSU:
  confidence: high
  verified:
    - [x] 10/10 acceptance criteria met
    - [x] pytest green (183)
    - [x] Critic approve
    - [x] AGENT.md synced (VAL, EXP, AGENT_INDEX)
  loop_back: no
```

### 5. Shipped

- Public repo + `v1.2.0` tag
- `astrosim scenarios/greenhouse_lunar.yaml --validate --report` → NASA benchmark **PASS**

---

## Before vs after gates

| Without gates | With this workflow |
|---------------|-------------------|
| Agent writes code immediately | Plan with numbered criteria first |
| "Tests pass" claimed without evidence | Failing test → green required |
| Self-review only | Separate critic role; approve required |
| "Done" when tired | AYSU block with confidence level |
| Context bloat (read everything) | AGENT_INDEX loads 1–3 section files |
| Interface drift | `contracts/` updated in PDD, tested in TDD |

---

## Tier growth in AstroSim

| Tier | When reached | What was added |
|------|--------------|----------------|
| 0–1 | Phase 1 | AGENTS.md, skills, first plans |
| 2 | Phase 6+ | CONTRIBUTING, PR template, CI |
| 3 | Phase 9+ | JSON schemas, contract tests, 80% coverage gate, per-module AGENT.md |

This scaffold ships **Tier 0–2** + Tier 3 templates. AstroSim proves Tier 3 is achievable incrementally.

---

## Lessons learned

1. **Numbered acceptance criteria** — map 1:1 to tests; critics can verify coverage mechanically.
2. **Defer scope in the plan** — Phase 16 explicitly deferred MC-aware interpretation; no scope creep.
3. **WARN vs FAIL** — validation uses soft envelopes where the model is simplified; document honesty in plan.
4. **Retire bad patterns** — RALF infinite loop deprecated; gates replaced it.
5. **Memory sync is not optional** — every behavior change updates section AGENT.md or drift accumulates.

---

## Try it yourself

```bash
git clone git@github.com:aadriantech/ai-coding-scaffold.git /tmp/scaffold
cd your-project
bash /tmp/scaffold/scripts/scaffold_init.sh .
```

Then `/pdd-plan` for your first epic. See [QUICKSTART.md](QUICKSTART.md).
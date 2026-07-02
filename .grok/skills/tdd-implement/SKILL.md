---
name: tdd-implement
description: >
  Test-Driven implementation. Use after PDD plan is ready, or for T0 trivial fixes.
  Triggers: "/tdd-implement", "implement plan", "make tests pass".
metadata:
  short-description: "TDD — tests first, then code"
---

# TDD Implement Skill

## Preconditions

- T1+: `docs/plans/<epic>.md` exists with `status: ready`
- Section `AGENT.md` loaded per AGENT_INDEX

## Steps

1. Read plan acceptance criteria and **Implementation tasks** (4-level `1.1.1.1` hierarchy).
2. Open a `todo_write` scaffold mirroring leaf task ids (e.g. `1.1.1.1`, `1.1.1.2`). Mark exactly one leaf `in_progress`.
3. Implement **one leaf at a time** — use only the context in that row; do not invent files or APIs not named in the plan.
4. **Assert:** write failing test(s) for the current leaf.
5. Run tests — confirm FAIL for the right reason.
6. **Launch:** minimal code change to green for the current leaf.
7. Mark leaf completed; advance to next leaf. Repeat until all leaves done.
8. Run full test suite.
9. If behavior changed, update section `AGENT.md` §Verification status.

## Must not

- Expand beyond plan scope
- Skip failing-test step
- Weaken tests to match wrong implementation without plan update

## Output

Diff summary + test result + tests added.
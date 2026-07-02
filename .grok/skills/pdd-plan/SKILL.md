---
name: pdd-plan
description: >
  Plan-Driven Design. Use when starting a new task, feature, or bugfix, or when user
  says "/pdd-plan", "write plan", "PDD", or task class T1+. Produces docs/plans/<epic>.md
  before any code.
metadata:
  short-description: "PDD — plan before code"
---

# PDD Plan Skill

## Read first

1. `AGENTS.md`
2. `AGENT_INDEX.md` → load relevant section `AGENT.md`
3. `docs/PRD.md`, `docs/SRD.md` (if present)

## Steps

1. Classify task: T0–T3 (default T2).
2. Copy `docs/plans/TEMPLATE.md` → `docs/plans/<epic>.md`.
3. Fill all sections. Acceptance criteria must be testable and numbered.
4. **Implementation tasks:** 4-level hierarchy (`1.1.1.1`). Every implementable path ends at level 4 with small, atomic context (target file, one action, expected outcome). No vague leaves — prevents hallucination during TDD.
5. Link `contracts/` for any interface change; add `planned` row in `contracts/README.md`.
6. Set frontmatter `status: ready` when complete.

## Must not

- Write or edit application code or tests
- Implement "just to explore"

## Output

Path to plan file + task_class + numbered acceptance criteria list + 4-level implementation task tree.
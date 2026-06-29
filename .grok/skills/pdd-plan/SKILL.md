---
name: pdd-plan
description: >
  Plan-Driven Design. Use when starting a new task, feature, or bugfix, or when user
  says "/pdd-plan", "write plan", "PDD", or task class T1+. Produces docs/plans/<epic>.md
  before any code. Tool-agnostic — works in any repo with AGENTS.md.
metadata:
  short-description: "PDD — plan before code"
---

# PDD Plan Skill

## Read first

1. `AGENTS.md`
2. `AGENT_INDEX.md` → load relevant section `AGENT.md`
3. Product/spec docs if they exist (`docs/PRD.md`, `docs/SRD.md`, etc.)

## Steps

1. Classify task: T0–T3 (default T2).
2. Copy `docs/plans/TEMPLATE.md` → `docs/plans/<epic>.md`.
3. Fill all sections. Acceptance criteria must be testable and numbered.
4. Link `contracts/` for any interface change.
5. Set frontmatter `status: ready` when complete.

## Must not

- Write or edit application code or tests
- Implement "just to explore"

## Output

Path to plan file + task_class + numbered acceptance criteria list.
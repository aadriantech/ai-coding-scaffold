---
name: reflexion
description: >
  Reflexion loop after a failed gate (AYSU medium/low, CDD revise, red tests).
  Writes structured reflection before retry. Triggers: "/reflexion", "loop back",
  "what went wrong".
metadata:
  short-description: "Reflexion — learn from failure before retry"
---

# Reflexion Skill

## When

- AYSU `loop_back: yes` or `confidence: medium|low`
- CDD `recommendation: revise`
- Same failure class hit twice (check `docs/errors/INDEX.md` first)

## Steps

1. Read plan criteria, review findings, and test output.
2. Write `reviews/<task-id>-reflection.md`:

```markdown
---
task_id: <task-id>
date: YYYY-MM-DD
gate_failed: AYSU | CDD | TDD
---

## What happened

## Root cause (not symptom)

## Fix for next attempt

## Error library candidate (E0xx title or "none")
```

3. If new failure class → append row to `docs/errors/INDEX.md` (or run `/error-sync`).
4. If fix is reusable → append row to `docs/patterns/SUCCESS.md`.
5. Hand back to implementer with reflection path — do not skip straight to code.

## Must not

- Retry without a reflection file on T2+ tasks
- Blame "flaky tests" without evidence
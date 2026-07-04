---
name: cdd-review
description: >
  Critic-Driven Design review. Adversarial review of diff vs plan and tests.
  Use after TDD green on T2+ tasks. Triggers: "/cdd-review", "critic pass".
metadata:
  short-description: "CDD — adversarial critic review"
---

# CDD Review Skill

## Role

You are the **critic**, not the implementer. Do not implement fixes.

## Read

1. Plan: `docs/plans/<epic>.md`
2. Diff or stated changed files
3. `contracts/critic_review.schema.md`

## Steps

1. Map each acceptance criterion → test coverage. Flag gaps.
2. Score **multi-critic lenses** in `reviews/TEMPLATE.md`: correctness · security · a11y · contracts.
3. File findings with severity (critical/high/medium/low) and lens column.
4. Write `reviews/<task-id>.md` using schema.
5. Set `recommendation: approve` only if zero open critical/high.

## Output

Path to review file + recommendation + finding counts.
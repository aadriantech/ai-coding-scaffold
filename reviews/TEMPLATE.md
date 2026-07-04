---
task_id: <task-id>
task_class: T2
plan: docs/plans/<epic>.md
reviewer: critic
date: YYYY-MM-DD
recommendation: revise
---

## Plan adherence

score: 0
notes:

## Multi-critic lenses (loop pattern #3)

Score each 0–2 (0=fail, 1=gap, 2=pass). Any 0 on critical/high area → `revise`.

| Lens | Score | Notes |
|------|-------|-------|
| Correctness — criteria met, tests map | | |
| Security — secrets, injection, auth | | |
| A11y — labels, keyboard, contrast (UI) | | |
| Contracts — schemas/APIs synced | | |

## Findings

| ID | Severity | Lens | Finding | Suggested fix |
|----|----------|------|---------|---------------|
| F1 | low | correctness | | |

## Checks

- [ ] Tests cover acceptance criteria
- [ ] No scope beyond plan
- [ ] Contracts updated if interfaces changed
- [ ] Section AGENT.md updated or N/A stated

## Summary

Set `recommendation: approve` only when zero open critical/high findings.
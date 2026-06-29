# Critic Review Schema (CDD)

Save as `reviews/<task-id>.md`.

```yaml
---
task_id: string
task_class: T0 | T1 | T2 | T3
plan: docs/plans/<epic>.md
reviewer: critic
date: ISO-8601
recommendation: approve | revise | escalate
---

## Plan adherence

score: 0-10
notes: string

## Findings

| ID | Severity | Area | Finding | Suggested fix |
|----|----------|------|---------|---------------|
| F1 | critical \| high \| medium \| low | file/module | | |

## Checks

- [ ] Tests cover acceptance criteria
- [ ] No scope beyond plan
- [ ] Contracts updated if interfaces changed
- [ ] Section AGENT.md updated or N/A stated

## Summary

`recommendation: approve` only when zero open critical/high.
```
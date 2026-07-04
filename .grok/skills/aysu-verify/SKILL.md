---
name: aysu-verify
description: >
  AYSU ("Are You Sure?") verification gate. Mandatory before declaring any task done.
  Triggers: "/aysu-verify", "are you sure", "mark complete".
metadata:
  short-description: "AYSU — self-verify before ship"
---

# AYSU Verify Skill

## Preconditions

- T2+: `reviews/<task-id>.md` with `recommendation: approve`
- Tests green

## Steps

1. Re-read plan acceptance criteria line by line.
2. Confirm each has evidence (test name or artifact).
3. Print mandatory block:

```
AYSU:
  confidence: high | medium | low
  task_class: T0 | T1 | T2 | T3
  verified:
    - [ ] Plan acceptance criteria met
    - [ ] Tests green
    - [ ] MCP UI verify + screenshots in playwright-mcp-output/ (UI tasks)
    - [ ] Critic approve (T2+)
    - [ ] Section AGENT.md synced (if behavior changed)
  residual_risks: <list or "none">
  loop_back: no
  attempts: <n>
  loop_back_count: <n>
```

4. **confidence: high** only if all boxes checked.
5. If medium/low → invoke `/reflexion` before retry; set `loop_back: yes`.

## Must not

Declare done without printing the AYSU block.
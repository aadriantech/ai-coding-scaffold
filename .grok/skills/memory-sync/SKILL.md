---
name: memory-sync
description: >
  Sync section AGENT.md files and AGENT_INDEX after behavior or API changes.
  Triggers: "/memory-sync", end of T2+ task, before release tag.
metadata:
  short-description: "Sync distributed agent memory"
---

# Memory Sync Skill

## When

- Public interface or gotcha changed
- New domain directory added
- Release tag

## Steps

1. Identify affected AGENT_INDEX ID(s).
2. Update section AGENT.md: §Gotchas, §Verification status, `Last verified` + commit sha.
3. Do **not** duplicate contracts — link `contracts/` instead.
4. Update AGENT_INDEX `Last synced` date; add row if new domain.
5. If new section `AGENT.md` is required for CI: add path to `scripts/check_agent_sync.sh` REQUIRED array.
6. Run `bash scripts/check_agent_sync.sh`.

## Rules

- Mark unconfirmed claims `UNVERIFIED`
- Keep each section file ≤80 lines
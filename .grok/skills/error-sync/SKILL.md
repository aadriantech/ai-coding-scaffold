---
name: error-sync
description: >
  Append session failure classes to docs/errors/INDEX.md. Use after reflexion or
  repeated E2E/debug failures. Triggers: "/error-sync", "update error library".
metadata:
  short-description: "Error library — stop repeating mistakes"
---

# Error Sync Skill

## Steps

1. Read `docs/errors/INDEX.md`.
2. For each new failure class from the session:
   - Assign next `E0xx` ID
   - One-line symptom, root cause, fix
3. Deduplicate — merge if same root cause as existing row.
4. Commit message: `docs: error library E0xx — <short title>`

## Must not

- Store stack traces or secrets in INDEX (symptoms only)
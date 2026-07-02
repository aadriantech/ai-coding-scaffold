---
task_id: "<e.g. epic-my-feature>"
task_class: T2
status: draft
epic: "<short name>"
spec_refs: []
tasklist_ref: docs/TASKLIST.md
approver: pending
---

# PDD: <Title>

## Problem

What and why. Link product/spec docs.

## Interfaces

List new/changed APIs, files, or `contracts/` entries.

## Edge cases

1.
2.
3.

## Acceptance criteria

1. [ ] Testable criterion
2. [ ] …

## Implementation tasks

Break work into a **4-level hierarchy** (`1` → `1.1` → `1.1.1` → `1.1.1.1`). Leaf tasks (level 4) are the only items an agent implements in one step.

**Rules:**

- **Minimum depth:** every implementable path ends at level 4 (e.g. `1.1.1.1`).
- **Small context:** each leaf names target file(s), one action, and expected outcome — enough to implement without guessing.
- **Atomic leaves:** one file change or one test per `x.x.x.x` row; split if larger.
- **Traceability:** leaf tasks map to acceptance criteria numbers where applicable.

**Format:**

```
1. <phase or component>
   1.1. <sub-component>
       1.1.1. <step>
           1.1.1.1. <atomic action — file, verb, outcome>
```

Example leaf: `1.2.1.1. Add test_cli_hello_flag in tests/test_cli.py — assert --hello prints "Hello" to stdout (AC #1)`

## Out of scope

-

## Implementation notes

Optional hints for implementer. Tests win if contradicted.

## CDD focus areas

Security / performance / conventions to scrutinize.
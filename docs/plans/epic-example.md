---
task_id: epic-example
task_class: T1
status: ready
epic: hello-cli
spec_refs: ["§2.1"]
approver: pending
---

# PDD: Example — Hello Command

> **How to read this file:** Each section below includes a *Why* line explaining what reviewers and agents expect. Delete the `> Why` blocks in real plans.

## Problem

Demonstrate the plan format for a trivial feature. Replace with real epics.

> **Why:** Links user pain to PRD/SRD. Implementer and critic both read this first.

## Interfaces

- CLI: `--hello` flag prints greeting
- No contract changes

> **Why:** Lists every file/API/schema that will change. If nothing here, critic knows scope is small.

## Edge cases

1. Flag passed with other flags — compose normally
2. Repeated flag — idempotent output

> **Why:** Numbered edge cases become tests or explicit non-goals.

## Acceptance criteria

1. [ ] `test_cli_hello_flag` passes — `--hello` prints "Hello" to stdout
2. [ ] Existing test suite remains green

> **Why:** Must be **testable and numbered**. Bad: "works well". Good: names a test and expected behavior. Critic maps each row to a test file.

## Out of scope

- i18n, config file, API endpoint

> **Why:** Stops scope creep. Agent must not implement items listed here without a new plan.

## Implementation notes

T1: light plan, skip CDD unless promoted to T2.

> **Why:** Optional hints. Tests win if they contradict this section.

## CDD focus areas

N/A for T1

> **Why:** T2+ lists security, performance, conventions for the critic to scrutinize.
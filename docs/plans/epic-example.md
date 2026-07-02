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

## Implementation tasks

1. CLI flag plumbing
   1.1. Argument parser
       1.1.1. Add `--hello` flag
           1.1.1.1. Edit `src/cli.py` `build_parser()` — add `--hello` store_true flag (AC #1)
       1.1.2. Wire flag to output
           1.1.2.1. Edit `src/cli.py` `main()` — if `args.hello`, print `"Hello"` to stdout (AC #1)
   1.2. Tests
       1.2.1. Hello flag test
           1.2.1.1. Add `test_cli_hello_flag` in `tests/test_cli.py` — subprocess with `--hello`, assert stdout contains `"Hello"` (AC #1)
       1.2.2. Regression guard
           1.2.2.1. Run full test suite — all existing tests remain green (AC #2)

> **Why:** 4-level hierarchy (`1.1.1.1`) keeps each implement step atomic and small-context. Agent works one leaf at a time; no guessing paths or APIs.

## Implementation notes

T1: light plan, skip CDD unless promoted to T2.

> **Why:** Optional hints. Tests win if they contradict this section.

## CDD focus areas

N/A for T1

> **Why:** T2+ lists security, performance, conventions for the critic to scrutinize.
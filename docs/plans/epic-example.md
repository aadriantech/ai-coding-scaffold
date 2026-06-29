---
task_id: epic-example
task_class: T1
status: ready
epic: hello-cli
spec_refs: ["§2.1"]
approver: pending
---

# PDD: Example — Hello Command

## Problem

Demonstrate the plan format for a trivial feature. Replace with real epics.

## Interfaces

- CLI: `--hello` flag prints greeting
- No contract changes

## Edge cases

1. Flag passed with other flags — compose normally
2. Repeated flag — idempotent output

## Acceptance criteria

1. [ ] `test_cli_hello_flag` passes — `--hello` prints "Hello" to stdout
2. [ ] Existing test suite remains green

## Out of scope

- i18n, config file, API endpoint

## Implementation notes

T1: light plan, skip CDD unless promoted to T2.

## CDD focus areas

N/A for T1
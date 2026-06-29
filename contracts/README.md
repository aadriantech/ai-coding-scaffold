# Contracts

**Canonical source** for interfaces. Section `AGENT.md` files link here — they do not duplicate field lists.

| File | Purpose | Status |
|------|---------|--------|
| [critic_review.schema.md](critic_review.schema.md) | CDD review output format | active |
| [api.schema.template.json](api.schema.template.json) | Starter JSON Schema — copy and rename | template |

<!-- Add project schemas:
| my_api.schema.json | REST export shape | planned → active |
-->

**Workflow:** PDD marks `planned` → TDD adds contract tests → implement → set `active`.

New interfaces: update contract first (PDD), then tests (TDD), then code.
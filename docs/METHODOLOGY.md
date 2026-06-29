# AI Coding Methodology

Portable **plan-before-code** system for Grok, Cursor, Claude Code, or any agentic IDE.

Derived from [AstroSim](https://github.com/aadriantech/astrosim). Five ideas: **pipeline**, **skills**, **memory**, **indexing**, **contracts**.

---

## 1. The pipeline (PDD → TDD → CDD → AYSU)

```
User request
    ↓
PDD (plan)          docs/plans/<epic>.md + numbered acceptance criteria
    ↓
TDD (implement)     failing test → green code → refactor
    ↓
CDD (review)        reviews/<task-id>.md — 0 critical/high to approve
    ↓
AYSU (verify)       structured confidence block before "done"
```

| Step | Name | Who | Output | Gate |
|------|------|-----|--------|------|
| 1 | **PDD** | Planner | `docs/plans/<epic>.md` | Numbered, testable acceptance criteria |
| 2 | **TDD** | Implementer | `src/` + `tests/` | Failing test → green → full suite green |
| 3 | **CDD** | Critic | `reviews/<task-id>.md` | `approve` = 0 critical/high findings |
| 4 | **AYSU** | Verifier | AYSU block | `confidence: high` or loop back |

**Hard rules:**

- No plan → no code
- No green tests → no CDD
- No CDD approve → no AYSU
- AYSU not high → loop back

### Task classes

| Class | Examples | Pipeline |
|-------|----------|----------|
| **T0** | Typo, comment | TDD (if tests touched) → AYSU |
| **T1** | Single module bugfix | Light PDD → TDD → AYSU |
| **T2** | API, cross-module, contracts | Full PDD → TDD → CDD → AYSU |
| **T3** | Release, CI, architecture | Full + human sign-off |

Default unknown work to **T2**.

---

## 2. Skills (slash commands)

Skills are short playbooks in `.grok/skills/<name>/SKILL.md`. They tell the agent what to read, produce, and avoid.

| Skill | Trigger | Role | Produces | Must NOT |
|-------|---------|------|----------|----------|
| `pdd-plan` | `/pdd-plan`, "write plan" | Planner | `docs/plans/<epic>.md` | Write code or tests |
| `tdd-implement` | `/tdd-implement`, "implement plan" | Implementer | `src/` + `tests/` | Skip failing-test step; expand scope |
| `cdd-review` | `/cdd-review`, "critic pass" | Critic | `reviews/<id>.md` | Fix code themselves |
| `aysu-verify` | `/aysu-verify`, "mark complete" | Verifier | AYSU block | Ship on low confidence |
| `memory-sync` | `/memory-sync`, after behavior change | Maintainer | Updated `AGENT.md` files | Duplicate contracts into memory |
| `scaffold-init` | `/scaffold-init`, new repo | Bootstrap | Copy templates into project | Overwrite without asking |

**Where they live:**

- **Project:** `<repo>/.grok/skills/` — shared with team, versioned in git
- **Global:** `~/.grok/skills/` — all your projects

**Key idea:** Skills are thin. The **files on disk** (plans, memory, contracts) hold the real knowledge.

---

## 3. Memory (distributed, not one giant prompt)

```
AGENT_INDEX.md          ← router (read FIRST)
AGENTS.md               ← operating manual (every session)
src/export/AGENT.md     ← section memory (on demand)
contracts/*.json        ← canonical truth (link, don't duplicate)
```

### Memory layers

| Layer | File | Contents | When to read |
|-------|------|----------|--------------|
| **Index** | `AGENT_INDEX.md` | Domain IDs, paths, load combinations | Every session, first |
| **Manual** | `AGENTS.md` | Pipeline, task classes, conventions | New session or unclear process |
| **Section** | `**/AGENT.md` | Scope, gotchas, VERIFIED/UNVERIFIED, tests | When touching that domain |
| **Plans** | `docs/plans/*.md` | Epics, acceptance criteria | Before implementation |
| **Reviews** | `reviews/*.md` | Critic findings | After TDD, before AYSU |
| **Contracts** | `contracts/` | Schemas, API shapes | When changing interfaces |

### Load protocol

1. `AGENT_INDEX.md`
2. `AGENTS.md` (if needed)
3. **One** primary section `AGENT.md`
4. Up to **two** secondary section `AGENT.md`
5. `contracts/` **only** if touching interfaces

**Never load all section files in one session.**

---

## 4. Indexing (`AGENT_INDEX.md`)

The index is a routing table. Example rows:

| ID | Domain | Path | Load when… |
|----|--------|------|------------|
| ROOT | Rules | `AGENTS.md` | Every session |
| PKG | Package | `src/AGENT.md` | Public API, CLI |
| TST | Tests | `tests/AGENT.md` | TDD, coverage |
| CON | Contracts | `contracts/README.md` | Schemas |

### Load combinations (pre-computed recipes)

| Work type | Primary | Secondary (max 2) |
|-----------|---------|-------------------|
| New feature | PKG | TST, CON |
| Bugfix | _domain_ | TST |
| CI / release | CIC | TST, ROOT |

Run `scripts/check_agent_sync.sh` to verify memory files exist. Use `/memory-sync` after behavior changes.

---

## 5. Each step in detail

### PDD — Plan-Driven Design

Plan file: `docs/plans/<epic>.md` with frontmatter `status: ready` when complete.

Must include: Problem, Interfaces, Edge cases, **numbered testable acceptance criteria**, Out of scope, CDD focus areas.

### TDD — Test-Driven Implementation

1. Read acceptance criteria
2. Write **failing** test
3. Confirm fail for the right reason
4. Minimal code to green
5. Full suite green
6. Update section `AGENT.md` if behavior changed

Fix application code, not tests, when the requirement is stable.

### CDD — Critic-Driven Design

Critic does **not** implement fixes. Output: `reviews/<task-id>.md` per `contracts/critic_review.schema.md`.

`recommendation: approve` only when **0 critical/high** findings.

### AYSU — "Are You Sure?"

```
AYSU:
  confidence: high | medium | low
  task_class: T0 | T1 | T2 | T3
  verified:
    - [ ] Plan acceptance criteria met
    - [ ] Tests green
    - [ ] Critic approve (T2+)
    - [ ] Section AGENT.md updated if behavior changed
  residual_risks: <list or "none">
  loop_back: no
```

---

## 6. Contracts

`contracts/` = canonical source for API shapes and review formats.

| Rule | Why |
|------|-----|
| Update contract in **PDD** | Interface agreed before code |
| Test against contract in **TDD** | Prevents drift |
| Section `AGENT.md` **links** contracts | No duplicate field lists |

---

## 7. Tool portability

| Concept | Grok | Cursor | Claude Code |
|---------|------|--------|-------------|
| Operating manual | `AGENTS.md` | `.cursorrules` / `AGENTS.md` | `CLAUDE.md` |
| Skills | `.grok/skills/` | Custom commands | `.claude/skills/` |
| Memory / plans / reviews | Same files on disk | Same | Same |

---

## 8. Cheat sheet

| I want to… | Do this |
|------------|---------|
| Start new feature | `/pdd-plan` |
| Implement approved plan | `/tdd-implement` |
| Review before merge | `/cdd-review` |
| Confirm task is done | `/aysu-verify` |
| Behavior/API changed | `/memory-sync` |
| New repo setup | `/scaffold-init` |
| Know what to read | `AGENT_INDEX.md` → primary `AGENT.md` |
| Know the rules | `AGENTS.md` |

---

## 9. Bootstrap a new project

```bash
git clone git@github.com:aadriantech/ai-coding-scaffold.git /tmp/scaffold
cd your-project
bash /tmp/scaffold/scripts/scaffold_init.sh .
bash scripts/check_agent_sync.sh
bash scripts/self_test.sh   # verifies round-trip bootstrap
```

Or run `/scaffold-init` in Grok. See [ADOPTION.md](ADOPTION.md) and [COMPLETENESS.md](COMPLETENESS.md).
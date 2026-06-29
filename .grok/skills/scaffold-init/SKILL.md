---
name: scaffold-init
description: >
  Bootstrap AI coding infrastructure into the current repo. Use when starting a new
  project or adding agent scaffolding. Triggers: "/scaffold-init", "add agent scaffold",
  "set up PDD TDD workflow".
metadata:
  short-description: "Bootstrap agent scaffolding into a repo"
---

# Scaffold Init Skill

## When

User wants PDD→TDD→CDD→AYSU in a repo that lacks it, or wants to copy from ai-coding-scaffold.

## Steps

1. Confirm repo root (look for `.git` or user-specified path).
2. Copy if missing (do not overwrite without `--force`):
   - `AGENTS.md`, `AGENT_INDEX.md`, `AGENT_TEMPLATE.md`
   - `docs/plans/TEMPLATE.md`
   - `contracts/README.md`, `contracts/critic_review.schema.md`
   - `scripts/check_agent_sync.sh`
   - `.grok/skills/` (pdd-plan, tdd-implement, cdd-review, aysu-verify, memory-sync)
3. `chmod +x scripts/check_agent_sync.sh`
4. Create `reviews/` directory.
5. Customize `AGENT_INDEX.md` for project domains.
6. Add `<!-- CUSTOMIZE -->` sections in `AGENTS.md` (language, test runner).
7. Run `bash scripts/check_agent_sync.sh`.

## Source template

- Repo: `git@github.com:aadriantech/ai-coding-scaffold.git`
- Local: clone or use files from `ai-coding-scaffold/` in workspace

## Must not

- Overwrite existing customized AGENTS.md without confirmation
- Add application code

## Output

List of files created + next step: "Run `/pdd-plan` for first epic."
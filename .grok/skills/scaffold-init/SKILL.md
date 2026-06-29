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

User wants PDD→TDD→CDD→AYSU in a repo that lacks it.

## Steps

1. Confirm repo root (`.git` or user path).
2. Prefer script: `bash /path/to/ai-coding-scaffold/scripts/scaffold_init.sh .`
   Or copy from `git@github.com:aadriantech/ai-coding-scaffold.git`
3. Do **not** overwrite customized files without `--force` / user confirmation.
4. User must customize:
   - `AGENTS.md` stack conventions
   - `docs/PRD.md`, `docs/SRD.md`
   - `tests/AGENT.md` test runner
   - `.github/workflows/ci.yml` real test job
5. Run `bash scripts/check_agent_sync.sh` (trim REQUIRED list if project is minimal Tier 1).

## Files copied

- Core: `AGENTS.md`, `AGENT_INDEX.md`, `AGENT_TEMPLATE.md`, `CONTRIBUTING.md`, `CLAUDE.md`
- Docs: `METHODOLOGY.md`, `ADOPTION.md`, `PRD.md`, `SRD.md`, `plans/TEMPLATE.md`
- GitHub: `.github/` (PR template, issue templates, workflows)
- Skills: `.grok/skills/`
- Cursor: `.cursor/rules/ai-coding.mdc`
- Stubs: `src/AGENT.md`, `tests/AGENT.md`
- Scripts: `check_agent_sync.sh`, `integrity_check.sh`
- Contracts: `contracts/README.md`, `critic_review.schema.md`
- Reviews: `reviews/TEMPLATE.md`

## Must not

- Add application code
- Overwrite existing `AGENTS.md` without confirmation

## Output

Files created + next: customize PRD → `/pdd-plan` for first epic.
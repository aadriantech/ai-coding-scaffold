# Adoption checklist

First-hour setup for a new repo using this scaffold.

## 1. Bootstrap (5 min)

```bash
git clone git@github.com:aadriantech/ai-coding-scaffold.git /tmp/ai-coding-scaffold
cd your-project

# Option A: run /scaffold-init in Grok
# Option B: copy manually:
cp -r /tmp/ai-coding-scaffold/.grok ./
cp /tmp/ai-coding-scaffold/{AGENTS.md,AGENT_INDEX.md,AGENT_TEMPLATE.md,CONTRIBUTING.md} ./
cp -r /tmp/ai-coding-scaffold/.github ./
mkdir -p docs/plans contracts reviews scripts tests
cp /tmp/ai-coding-scaffold/docs/{PRD.md,SRD.md,ADOPTION.md,METHODOLOGY.md} docs/
cp /tmp/ai-coding-scaffold/docs/plans/TEMPLATE.md docs/plans/
cp /tmp/ai-coding-scaffold/contracts/* contracts/
cp /tmp/ai-coding-scaffold/scripts/* scripts/
cp /tmp/ai-coding-scaffold/tests/AGENT.md tests/
cp /tmp/ai-coding-scaffold/reviews/TEMPLATE.md reviews/
chmod +x scripts/*.sh
```

## 2. Customize (10 min)

| File | Action |
|------|--------|
| `AGENTS.md` | Fill `<!-- CUSTOMIZE -->` stack conventions |
| `AGENT_INDEX.md` | Add domains as modules appear |
| `docs/PRD.md` | Write product vision |
| `docs/SRD.md` | Write technical requirements |
| `tests/AGENT.md` | Set test runner command |
| `.github/AGENT.md` | Document your CI workflows |
| `.github/workflows/ci.yml` | Add project test job (copy template if provided) |

## 3. Verify (2 min)

```bash
bash scripts/check_agent_sync.sh
```

Push to GitHub — `ci.yml` runs `check_agent_sync.sh` on PR/push.

## 4. First task (30 min)

1. `/pdd-plan` → `docs/plans/epic-hello.md` (one small feature)
2. `/tdd-implement`
3. `/cdd-review` (if T2)
4. `/aysu-verify`
5. Open PR using template

## 5. Grow over time

| Milestone | Add |
|-----------|-----|
| First API | `contracts/<name>.schema.json` + contract tests |
| First module | `src/<module>/AGENT.md` + AGENT_INDEX row |
| Pre-release | `scripts/integrity_check.sh` + extend CI |
| Phase tracking | `docs/ROADMAP.md` |

## Tool-specific

| Tool | Also copy |
|------|-----------|
| Cursor | `.cursor/rules/ai-coding.mdc` |
| Claude Code | `CLAUDE.md` |
| Grok | `.grok/skills/` (included) |

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `check_agent_sync.sh` fails | Missing file — copy from scaffold or remove from REQUIRED |
| Agent loads too much context | Follow load protocol: one primary AGENT.md only |
| Critic never approves | Map each acceptance criterion to a named test |
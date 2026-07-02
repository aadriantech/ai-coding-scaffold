# Adoption checklist

First-hour setup for a new repo using this scaffold.

## 1. Bootstrap (5 min)

**Option A — script (recommended):**

```bash
git clone git@github.com:aadriantech/ai-coding-scaffold.git /tmp/scaffold
cd your-project   # must already be a git repo or project directory
bash /tmp/scaffold/scripts/scaffold_init.sh .
bash scripts/self_test.sh   # optional — verifies scaffold copy + agent sync
```

**Option B — Grok:** run `/scaffold-init` in your project (same result).

**Option C — manual:** only if you need a subset; see `scripts/scaffold_init.sh` for the full file list.

## 2. Customize (10 min)

| File | Action |
|------|--------|
| `AGENTS.md` | Fill `<!-- CUSTOMIZE -->` stack conventions |
| `AGENT_INDEX.md` | Add domains as modules appear |
| `docs/PRD.md` | Write product vision |
| `docs/SRD.md` | Write technical requirements |
| `tests/AGENT.md` | Set test runner command |
| `.github/AGENT.md` | Document your CI workflows |
| `.github/workflows/ci.yml` | Vitest + Playwright included — adapt paths to your app |
| `docs/CUSTOMIZE_MONOREPO.md` | **Required for `apps/*` monorepos** — customize `check_agent_sync.sh` |

## 3. Verify (2 min)

```bash
npm ci && npm run validate   # coverage ≥90% + Playwright e2e
bash scripts/check_agent_sync.sh
```

Push to GitHub — `ci.yml` runs agent memory, coverage, and e2e on PR/push.

## 4. First task (30 min)

See [QUICKSTART.md](QUICKSTART.md) for the full walkthrough with expected outputs.

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
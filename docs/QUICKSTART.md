# Quickstart (5 minutes)

Bootstrap the workflow, run your first gated task.

## Prerequisites

- A project directory (ideally already `git init`)
- Grok, Cursor, or Claude Code (optional for step 4)

## Step 1: Bootstrap (1 min)

```bash
git clone git@github.com:aadriantech/ai-coding-scaffold.git /tmp/scaffold
cd your-project
bash /tmp/scaffold/scripts/scaffold_init.sh .
bash scripts/check_agent_sync.sh
```

Expected output:

```
Agent memory check OK (39 files)
```

Optional:

```bash
bash scripts/self_test.sh
# SELF TEST OK
```

## Step 2: Customize (2 min)

| File | Minimum change |
|------|----------------|
| `docs/PRD.md` | One paragraph: what your product does |
| `AGENTS.md` | Fill `<!-- CUSTOMIZE -->` (language, test command) |
| `tests/AGENT.md` | Set your test runner (`pytest`, `npm test`, etc.) |

Skip the rest for now.

## Step 3: Write product specs (optional, 2 min)

Skim and fill headers in `docs/SRD.md` if you have technical requirements.  
`/pdd-plan` reads PRD/SRD when present.

## Step 4: First epic (10–30 min)

### 4a. Plan (PDD)

In Grok:

```
/pdd-plan
Add a --version flag to the CLI that prints the package version.
```

Or copy `docs/plans/epic-example.md` → `docs/plans/epic-hello.md` and edit.

**Gate:** `status: ready` in frontmatter + numbered acceptance criteria + 4-level implementation tasks (`1.1.1.1`).

**Good criterion:**

```markdown
1. [ ] `test_cli_version_flag` — `--version` prints `myapp 1.0.0` and exits 0
```

**Bad criterion:**

```markdown
1. [ ] Version flag works well
```

See annotated plan: [docs/plans/epic-example.md](plans/epic-example.md)

### 4b. Implement (TDD)

```
/tdd-implement
Implement docs/plans/epic-hello.md
```

Agent must:

1. Write a **failing** test
2. Run tests — confirm fail
3. Implement minimal code
4. Full suite green

### 4c. Review (CDD) — T2 only

For cross-module work:

```
/cdd-review
Review changes against docs/plans/epic-hello.md
```

Output: `reviews/epic-hello.md` with `recommendation: approve`  
Example: [reviews/example-approved.md](../reviews/example-approved.md)

T1 tasks (like `epic-example`) can skip CDD.

### 4d. Verify (AYSU)

```
/aysu-verify
```

Print the AYSU block with `confidence: high` before merging.

## Step 5: Open a PR

GitHub auto-fills `.github/pull_request_template.md`.  
Check boxes. Paste AYSU block. Link plan + review (if T2).

## What you should have on disk

```
your-project/
├── AGENTS.md
├── AGENT_INDEX.md
├── docs/plans/epic-hello.md    ← plan
├── reviews/epic-hello.md       ← review (T2+)
├── tests/test_cli.py           ← tests added
└── src/...                     ← implementation
```

## Next steps

| Doc | When |
|-----|------|
| [ADOPTION.md](ADOPTION.md) | Full first-hour checklist |
| [METHODOLOGY.md](METHODOLOGY.md) | Deep reference |
| [CASE_STUDY_ASTROSIM.md](CASE_STUDY_ASTROSIM.md) | Real 16-phase proof |
| [COMPARE.md](COMPARE.md) | vs spec-kit, BMAD |
| [COMPLETENESS.md](COMPLETENESS.md) | Tier 0–3 self-audit |

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `check_agent_sync.sh` fails | Re-run `scaffold_init.sh` or compare file list in script |
| Agent codes without plan | Point to `AGENTS.md` gate: no plan → no code |
| Critic never approves | Each acceptance criterion needs a named test |
| Too much context loaded | AGENT_INDEX → one primary AGENT.md only |
# Monorepo customization

Single-package defaults (`src/`, `tests/`) work for libraries and small apps. **Monorepos** (e.g. `apps/web` + `apps/api`) must customize agent memory paths or CI will fail.

Live reference: [Astroforge (Space Pulse)](https://github.com/aadriantech/astroforge).

## 1. `scripts/check_agent_sync.sh`

Replace generic paths with your layout. Example swaps:

| Default (scaffold) | Monorepo (Astroforge) |
|--------------------|------------------------|
| `src/AGENT.md` | `apps/api/README.md`, `apps/web/README.md` |
| `contracts/api.schema.template.json` | `packages/contracts/openapi.yaml` |
| — | `scripts/check_coverage.sh` |

Keep `contracts/critic_review.schema.md` unless you relocate it — update `contracts/README.md` to match.

## 2. `AGENT_INDEX.md`

Add rows per app/package:

```markdown
| WEB | SvelteKit frontend | apps/web/README.md | UI, Pages deploy |
| API | Go backend | apps/api/README.md | REST, Tunnel |
| TST | Tests | tests/AGENT.md | TDD, coverage |
```

## 3. `tests/AGENT.md`

Document **all** test entrypoints:

```markdown
- Go: `cd apps/api && go test ./...`
- Web unit: `npm test --prefix apps/web`
- Coverage: `npm run test:coverage` → `scripts/check_coverage.sh`
- E2E: `npm run test:e2e --prefix apps/web`
```

## 4. `scripts/self_test.sh`

For application repos, **do not** re-run `scaffold_init` from yourself. Use:

```bash
bash scripts/check_agent_sync.sh
```

Scaffold source repos keep the full bootstrap self-test (see this repo's `scripts/self_test.sh`).

## 5. `scripts/integrity_check.sh`

Wire your validate command:

```bash
npm run validate   # or pytest, cargo test, etc.
```

## 6. CI

Copy the `coverage` + `test` jobs from Astroforge if you use Go + SvelteKit, or adapt `check_coverage.sh` for your stacks.

## Checklist after customize

```bash
bash scripts/check_agent_sync.sh
npm ci && npm run validate   # if Node toolchain
git push                     # confirm GitHub Actions green
```
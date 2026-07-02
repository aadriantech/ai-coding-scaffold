---
name: ui-verify
description: >
  MCP Playwright UI verification. Use before human validation or after UI changes.
  Requires playwright MCP enabled (/mcps). Triggers: "/ui-verify", "check UI",
  "screenshot pages", "MCP playwright".
metadata:
  short-description: "MCP Playwright — browse, snapshot, screenshot UI"
---

# UI Verify Skill (MCP Playwright)

## Preconditions

- `[mcp_servers.playwright]` in `.grok/config.toml` (project) or `~/.grok/config.toml`
- `grok mcp doctor playwright` → healthy
- App running locally (e.g. `npm run dev` on `:5173`, API on `:8081`)
- Playwright MCP enabled in session (`/mcps` → Space on `playwright`)

## Steps

1. Confirm dev stack is up (`curl` health + home page).
2. Use MCP tools (via `search_tool` / `use_tool` or direct invocation):
   - `browser_navigate` — open each route
   - `browser_snapshot` — accessibility tree; assert headings, links, data cards
   - `browser_take_screenshot` — save to `playwright-mcp-output/` for visual record
3. Cover checklist from `docs/MCP_UI_VALIDATION.md` (or project `HUMAN_VALIDATION.md`).
4. Report: route, pass/fail, screenshot paths, console errors if any.
5. If regressions: file plan update or fix via TDD — do not skip failing checks.

## npm regression gate (CI)

MCP is for **interactive** Grok checks. CI still runs:

```bash
npm run test:e2e:ui   # or npm run test:e2e
```

## Must not

- Ship UI changes with only MCP pass and broken `npm run test:e2e`
- Skip screenshots when user asked for visual verification

## Output

AYSU-style block:

```
UI_VERIFY:
  mcp: playwright
  routes_checked: [...]
  screenshots: playwright-mcp-output/...
  npm_e2e: pass | fail | not_run
  confidence: high | medium | low
```
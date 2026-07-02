# MCP Playwright UI validation

**Mandatory rule (UI tasks):** Grok must run **`/ui-verify`** with MCP Playwright and save **one screenshot per route** to `playwright-mcp-output/` before human validation or AYSU. npm `test:e2e` remains the CI regression gate.

Use **Grok + Playwright MCP** for interactive UI checks (snapshots + screenshots). Use **npm Playwright** for CI regression gates.

## Setup (once per project)

### 1. Enable MCP (project-scoped)

`.grok/config.toml` is copied by `scaffold_init.sh`. Or add manually:

```bash
grok mcp add --scope project playwright -- \
  npx -y @playwright/mcp@latest --headless --browser=chromium --caps=vision \
  --output-dir=playwright-mcp-output
```

Verify:

```bash
grok mcp doctor playwright
```

In Grok TUI: `/mcps` → enable **playwright**.

### 2. WSL browser deps (one-time)

```bash
sudo npx playwright install-deps chromium
```

### 3. Start app

```bash
npm run dev
```

## Grok workflow

Invoke **`/ui-verify`** or ask Grok to navigate, snapshot, and screenshot each route.

### Demo scaffold routes

| Route | Expect |
|-------|--------|
| `/` | Heading "AI Coding Scaffold", tagline, Get Started button |
| Button click | Tagline changes to "TDD next." |

## Two-layer testing

| Layer | Tool | When |
|-------|------|------|
| Interactive | Grok + MCP Playwright | Pre-human validation |
| Regression | `npm run test:e2e` | CI / PR |

```bash
npm run validate
```
# AGENT — Tests

**Scope:** Test suite, TDD discipline, coverage.  
**Owns:** `tests/**`  
**Depends on:** ROOT  
**Last verified:** YYYY-MM-DD · baseline

## Conventions

<!-- CUSTOMIZE: test runner, coverage target -->
- Run: `pytest tests/ -q` (or project equivalent)
- One concern per test; name describes behavior
- No live network/external APIs in CI unless explicitly marked integration
- Fix application code, not tests, when requirement is stable

## Layout

| Pattern | Purpose |
|---------|---------|
| `test_<module>.py` | Unit tests |
| `test_contracts_*.py` | Schema / interface contract tests |
| `test_integration_*.py` | Cross-module flows |

## Verification status

| Claim | Status |
|-------|--------|
| TDD: failing test before implementation | VERIFIED — process |
| CI runs test suite | UNVERIFIED — configure in `.github/workflows/` |

## Do not

- Skip failing-test step for T1+ work
- Weaken tests to match incorrect implementation without plan update
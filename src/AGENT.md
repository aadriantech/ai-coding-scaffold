# AGENT — Package / Application

**Scope:** Public API, CLI entrypoint, package surface.  
**Owns:** `src/**` (or project app root)  
**Depends on:** CON, TST  
**Last verified:** 2026-07-01 · demo lib baseline

## Purpose

Demo utilities (`greet`, `slugify`) illustrating TDD + coverage gates. Replace with your application code after bootstrap.

## Interfaces

Canonical contracts: `contracts/`. Link only — do not duplicate schemas.

| Symbol | Notes |
|--------|-------|
| `greet(name?)` | Returns `Hello, <name>!` (default `world`) |
| `slugify(text)` | URL-safe slug from arbitrary text |

## Gotchas

-

## Verification status

| Claim | Status |
|-------|--------|
| Unit tests green, ≥90% coverage | VERIFIED |

## Tests

- `src/lib/*.test.ts`

## Related

- Plan: `docs/plans/<epic>.md`
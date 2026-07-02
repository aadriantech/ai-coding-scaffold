# <!-- Product Name --> — Granular Task List

**Version:** 0.1  
**Date:** YYYY-MM-DD  
**Parent:** [`SRD.md`](./SRD.md)  
**Status:** draft

---

## How to use

| Column | Meaning |
|--------|---------|
| **ID** | Hierarchical task ID (`Phase.Section.Subsection.Task`) — same depth as plan leaves (`1.1.1.1`) |
| **Status** | `⬜` todo · `🔄` in progress · `✅` done · `⏸` blocked |
| **SRD Ref** | Traceability to requirement IDs in `SRD.md` |
| **Est.** | Rough effort (solo dev) |
| **Deps** | Task IDs that must complete first |

**Execution order:** Numeric ID order unless deps allow parallel work within a phase.

**Relationship to plans:**

- **`TASKLIST.md`** — full product backlog (phases, hundreds of atomic tasks).
- **`docs/plans/<epic>.md`** — one epic slice with acceptance criteria + implementation tasks; reference `tasklist_ref: docs/TASKLIST.md` in frontmatter when applicable.

---

## Summary

| Phase | Name | Tasks | Est. |
|-------|------|-------|------|
| 1 | <!-- e.g. Foundation --> | 1.1–1.x | — |
| 2 | <!-- e.g. Core feature --> | 2.1–2.x | — |
| **Total** | | | |

---

# Phase 1 — <!-- Phase name -->

## 1.1 <!-- Section name -->

| ID | Task | Status | SRD Ref | Est. | Deps |
|----|------|--------|---------|------|------|
| 1.1.1 | <!-- rollup task --> | ⬜ | | | — |
| 1.1.1.1 | <!-- atomic: file, verb, outcome --> | ⬜ | | | 1.1.1 |
| 1.1.1.2 | <!-- next leaf --> | ⬜ | | | 1.1.1 |

## 1.2 <!-- Section name -->

| ID | Task | Status | SRD Ref | Est. | Deps |
|----|------|--------|---------|------|------|
| 1.2.1 | | ⬜ | | | 1.1 |

---

# Phase 2 — <!-- Phase name -->

<!-- Copy Phase 1 table structure per section -->

---

*End of TASKLIST template — replace placeholders; delete unused phases.*
# Success patterns

Proven combos from shipped epics. Retrieve before inventing a new approach.

| ID | Task type | Pattern | Evidence |
|----|-----------|---------|----------|
| S001 | Hub partial failure E2E | `?e2e_*_fail=1` query param in `+page.server.ts` | Astroforge hub ErrorCard test |
| S002 | Feedback + localStorage E2E | SvelteKit form `actions` + `$effect` enqueue after `form` prop | Astroforge feedback queue test |
| S003 | Mobile nav E2E | `<details bind:open>` + `#mobile-nav-drawer` locator | Astroforge mobile-responsive spec |
| S004 | Multi-critic CDD | Four sections in review template before `approve` | `reviews/TEMPLATE.md` |

Add rows via `/memory-sync` after AYSU `confidence: high`.
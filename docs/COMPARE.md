# Comparison: AgentForge vs alternatives

Honest positioning. This scaffold is **AgentForge** (repo: [ai-coding-scaffold](https://github.com/aadriantech/ai-coding-scaffold)).

**Proof of workflow:** [AstroSim](https://github.com/aadriantech/astrosim) — built with this pipeline, v1.2.0, 183 tests.

---

## At a glance

| | **AgentForge (ours)** | **[GitHub spec-kit](https://github.com/github/spec-kit)** | **[BMAD Method](https://github.com/bmad-code-org/BMAD-method)** | **Ad hoc Cursor rules** |
|---|----------------------|----------------------------------------------------------|----------------------------------------------------------------|------------------------|
| **Core idea** | Plan → test → critic → verify | Constitution → spec → plan → implement | Persona agents (PM, architect, dev, QA) | Single AGENTS.md / rules file |
| **Test-first** | **Mandatory (TDD)** | Optional / downstream | Varies by track | Rare |
| **Critic gate** | **CDD — separate review file** | Implicit in workflow | QA persona | None |
| **Done gate** | **AYSU confidence block** | Implement complete | Checklists | None |
| **Memory model** | **AGENT_INDEX + section AGENT.md** | Spec files | Many docs / agents | One file |
| **Bootstrap** | `scaffold_init.sh` (35 files, self-test) | CLI install | Installer / large template | Copy-paste |
| **Weight** | **Lean** | Medium | **Heavy** | Minimal |
| **Contracts / schemas** | `contracts/` + tests | Spec artifacts | Varied | None |
| **CI enforcement** | `check_agent_sync.sh` template | Growing | Community patterns | DIY |
| **Shipped product proof** | **AstroSim** | GitHub-backed toolkit | Community projects | N/A |

---

## When to use AgentForge (ours)

- You want **tests before implementation**, not specs alone
- You want a **separate critic pass** before merge (CDD)
- You want **lean files** — not a 50-document methodology install
- You use **Grok skills** or can map to Cursor/Claude rules
- You want **distributed memory** (load 1–3 domain files, not entire wiki)
- You liked how **AstroSim** was built and want the same rails

## When to use spec-kit

- You want **GitHub-native** spec-driven development
- Constitution + `/specify` + `/plan` fits your team language
- You're all-in on **executable specs** as primary artifact
- You want official GitHub backing and momentum

## When to use BMAD

- You want **role personas** (PM, architect, sm, dev) enacted by agents
- Large projects with **document-heavy** agile AI process
- You prefer **breadth** (many agents, many templates) over minimal gates
- Community scale matters more than bootstrap time

## When to use ad hoc rules only

- Solo hack, throwaway prototype
- T0 work only (typos, one-liners)
- You accept **no gates** and self-verify only

---

## Feature-by-feature

### Planning

| | Ours | spec-kit | BMAD |
|---|------|----------|------|
| Plan artifact | `docs/plans/<epic>.md` | `/plan` output | Story/epic docs |
| Acceptance criteria | **Numbered, testable** | Tasks / stories | Stories + checklists |
| Task classes | T0–T3 | Phases | Tracks / agents |
| Out of scope section | **Required in template** | Varies | Varies |

### Implementation

| | Ours | spec-kit | BMAD |
|---|------|----------|------|
| Failing test first | **Required** | Not central | Track-dependent |
| Fix tests vs code | Fix code when spec stable | Varies | Varies |

### Review

| | Ours | spec-kit | BMAD |
|---|------|----------|------|
| Adversarial critic | **CDD — `reviews/<id>.md`** | Review in workflow | QA agent |
| Approve gate | 0 critical/high | Varies | Checklists |
| Critic implements fixes | **Forbidden** | Varies | Varies |

### Verification

| | Ours | spec-kit | BMAD |
|---|------|----------|------|
| Structured done block | **AYSU** | Completion | Checklists |
| Confidence levels | high / medium / low | — | — |
| Loop back | **Explicit** | — | — |

### Memory

| | Ours | spec-kit | BMAD |
|---|------|----------|------|
| Router | **AGENT_INDEX.md** | Spec index | Agent map |
| Domain files | **section AGENT.md** | Specs | Agent docs |
| Load limit | **1 primary + 2 secondary** | — | — |
| Interface truth | **contracts/** | Specs | Varied |

---

## What we do better

1. **TDD as a hard gate** — not optional narrative
2. **AYSU** — explicit "are you sure?" with confidence levels
3. **Lean bootstrap** — `scaffold_init.sh` + self-test in minutes
4. **AstroSim case study** — real product, not toolkit-only
5. **Retired infinite loops** — gates beat RALF-style "keep going"

## What others do better

1. **spec-kit** — brand, GitHub integration, momentum
2. **BMAD** — community size, persona richness, enterprise storytelling
3. **Ad hoc rules** — zero setup time for tiny tasks

---

## Can you combine them?

Yes, selectively:

| Combine | Approach |
|---------|----------|
| spec-kit + ours | spec-kit for `/specify`; our PDD for test criteria + CDD + AYSU |
| BMAD + ours | BMAD personas for discovery; our gates for implementation PRs |
| Cursor rules + ours | `.cursor/rules` points to `AGENTS.md`; skills map to commands |

Don't stack full BMAD + full spec-kit + full AgentForge — pick one **primary** pipeline.

---

## Summary

**AgentForge is the disciplined, test-first, lean option** with a shipped reference app (AstroSim).  
Choose spec-kit for GitHub spec-native teams. Choose BMAD for persona-heavy enterprise agile AI.  
Choose us when **gates, tests, and proof** matter more than toolkit size.

[Get started →](QUICKSTART.md)
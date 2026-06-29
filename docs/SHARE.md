# Share this project

Copy-paste pack for promoting [ai-coding-scaffold](https://github.com/aadriantech/ai-coding-scaffold).  
**Proof app:** [AstroSim](https://github.com/aadriantech/astrosim) · **Start here:** [QUICKSTART.md](QUICKSTART.md)

---

## Links (use everywhere)

| Link | Use |
|------|-----|
| https://github.com/aadriantech/ai-coding-scaffold | Main repo |
| https://github.com/aadriantech/ai-coding-scaffold/blob/main/docs/QUICKSTART.md | “Start here” |
| https://github.com/aadriantech/astrosim | Proof we shipped a real app |
| https://aadriantech.github.io/astrosim/ | Docs / credibility |
| https://github.com/aadriantech/ai-coding-scaffold/blob/main/docs/COMPARE.md | vs spec-kit, BMAD |
| https://github.com/aadriantech/ai-coding-scaffold/blob/main/docs/DECISIONS.md | Why RALF was retired |

**Bio line (X / GitHub / LinkedIn):**

```
Building AstroSim · open agent workflow (PDD→TDD→CDD→AYSU) · github.com/aadriantech
```

---

## X (Twitter)

### Post 1 — launch

```
We retired "let the agent loop until done" and shipped 16 phases of AstroSim with gates instead:

PDD → TDD → CDD → AYSU
(plan → failing test → critic → "are you sure?")

Open-sourced the workflow:
https://github.com/aadriantech/ai-coding-scaffold

Built AstroSim with it: https://github.com/aadriantech/astrosim
```

### Post 2 — AYSU hook

```
Most agent workflows stop at "tests pass."

We added AYSU — a structured confidence gate before merge. Same agent can't self-declare "done" without a checklist.

Free scaffold (MIT): https://github.com/aadriantech/ai-coding-scaffold
```

### Post 3 — positioning

```
spec-kit = spec-driven
BMAD = persona-heavy
This = test-first + separate critic + lean files

We used it to build a public simulator (183 tests). 5 min setup:

https://github.com/aadriantech/ai-coding-scaffold/blob/main/docs/QUICKSTART.md
```

**Tip:** Attach a screenshot — PR template with AYSU block, or AstroSim `astrosim ... --validate` PASS table.

---

## Reddit

### Where to post

| Subreddit | Title |
|-----------|--------|
| r/cursor | `Show: gated agent workflow we used instead of infinite loops — plan, TDD, critic review before ship` |
| r/ClaudeAI | `Open-sourced our PDD→TDD→CDD→AYSU scaffold (built a full app with it)` |
| r/Python | `AstroSim + the agent workflow behind it — 183 tests, NASA benchmark validation` |
| r/opensource | `[MIT] ai-coding-scaffold — plan-before-code infrastructure for agentic IDEs` |

### Body (copy-paste)

```
Problem: autonomous agent loops were fast but hard to audit (scope creep, self-review).

What we did: explicit gates — plan with numbered criteria, failing test first, separate critic pass, AYSU verify before merge.

Proof: AstroSim (open habitat simulator, 16 phases, v1.2.0)
Scaffold: https://github.com/aadriantech/ai-coding-scaffold
Quickstart: https://github.com/aadriantech/ai-coding-scaffold/blob/main/docs/QUICKSTART.md

Compare vs spec-kit/BMAD: https://github.com/aadriantech/ai-coding-scaffold/blob/main/docs/COMPARE.md

MIT. Feedback welcome.
```

Post to **1–2** subreddits per day, not all at once.

---

## Hacker News — Show HN

**Title:**

```
Show HN: Agent workflow we used to build AstroSim – plan, TDD, critic gate, AYSU verify
```

**First comment (post immediately):**

```
Repo: https://github.com/aadriantech/ai-coding-scaffold

We retired fully autonomous RALF-style loops for PDD→TDD→CDD→AYSU after building AstroSim (https://github.com/aadriantech/astrosim).

Not another app template — it's the files + skills for gated agent dev. 5 min bootstrap: docs/QUICKSTART.md

Happy to answer how this differs from spec-kit / BMAD.
```

**Timing:** Tuesday–Thursday morning US tends to work best.

---

## LinkedIn

```
Shipped two open-source repos:

1. AstroSim — space habitat simulator (Python, 183 tests, public)
2. ai-coding-scaffold — the agent workflow behind it

Lesson: infinite "agent loops" weren't auditable. Gates worked better:
plan → failing test → critic review → confidence check before merge.

If your team uses Cursor/Grok/Claude for code, the 5-minute setup is in QUICKSTART.md.

Links in comments.
```

Put URLs in the **first comment** (often better reach than in the post body).

---

## Grok / agent communities

- Point people at **QUICKSTART** + `/scaffold-init` + `/pdd-plan`.
- Ask for feedback: *“Try one small epic — does the gate feel useful vs raw agent loop?”*
- Link [DECISIONS.md](DECISIONS.md) when discussing why RALF was retired.

---

## Dev.to / blog (optional)

**Title:** `We Retired Our Agent Loop and Shipped 16 Phases Anyway`

**Outline:**

1. RALF-style loops — fast, hard to trust ([DECISIONS.md](DECISIONS.md))
2. Gates: PDD → TDD → CDD → AYSU
3. Proof: AstroSim ([CASE_STUDY_ASTROSIM.md](CASE_STUDY_ASTROSIM.md))
4. Try in 5 min ([QUICKSTART.md](QUICKSTART.md))
5. vs spec-kit / BMAD ([COMPARE.md](COMPARE.md))

~800 words. Link repos at top and bottom.

---

## Suggested posting schedule

| Day | Action |
|-----|--------|
| 1 | X Post 1 + ensure repo README links QUICKSTART |
| 2 | r/cursor or r/ClaudeAI |
| 3 | Show HN |
| 4 | X Post 2 + LinkedIn |
| 5 | Reply to all comments; update docs from feedback |

---

## Do / don't

| Do | Don't |
|----|-------|
| Lead with AstroSim proof | Claim "better than everything" |
| Link QUICKSTART every time | Spam 10 subreddits same day |
| Say *lean + test-first + shipped app* | Overpromise autonomous RALF v2 (it's proposed, not shipped) |
| Respond to every comment first 48h | Post without a screenshot or concrete hook |

---

## Prompt for AI to customize posts

```
Rewrite share copy for [CHANNEL: X / Reddit / HN / LinkedIn] using our AstroSim + ai-coding-scaffold experience. Under 280 chars for X, under 400 words for Reddit. Keep links. Emphasize: retired autonomous loop, gated PDD→TDD→CDD→AYSU, 183 tests, 5 min QUICKSTART. Tone: technical, honest, not hype.
```
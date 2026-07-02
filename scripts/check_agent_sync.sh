#!/usr/bin/env bash
# Verify agent memory infrastructure exists.
# Monorepo? Customize REQUIRED[] — see docs/CUSTOMIZE_MONOREPO.md (Astroforge example).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

REQUIRED=(
  "AGENTS.md"
  "AGENT_INDEX.md"
  "AGENT_TEMPLATE.md"
  "CONTRIBUTING.md"
  "CLAUDE.md"
  "CHANGELOG.md"
  "contracts/README.md"
  "contracts/critic_review.schema.md"
  "contracts/api.schema.template.json"
  "docs/METHODOLOGY.md"
  "docs/ADOPTION.md"
  "docs/COMPLETENESS.md"
  "docs/PRD.md"
  "docs/SRD.md"
  "docs/ROADMAP.md"
  "docs/plans/TEMPLATE.md"
  "docs/plans/epic-example.md"
  "reviews/TEMPLATE.md"
  "scripts/integrity_check.sh"
  "scripts/check_coverage.sh"
  "scripts/self_test.sh"
  "package.json"
  "vitest.config.ts"
  "playwright.config.ts"
  "src/AGENT.md"
  "tests/AGENT.md"
  ".github/AGENT.md"
  ".github/pull_request_template.md"
  "scripts/scaffold_init.sh"
  ".github/workflows/ci.yml"
  ".github/ISSUE_TEMPLATE/feature_request.md"
  ".github/ISSUE_TEMPLATE/bug_report.md"
  ".cursor/rules/ai-coding.mdc"
  ".grok/skills/pdd-plan/SKILL.md"
  ".grok/skills/tdd-implement/SKILL.md"
  ".grok/skills/cdd-review/SKILL.md"
  ".grok/skills/aysu-verify/SKILL.md"
  ".grok/skills/memory-sync/SKILL.md"
  ".grok/skills/scaffold-init/SKILL.md"
)

missing=0
for f in "${REQUIRED[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "MISSING: $f"
    missing=1
  fi
done

if [[ $missing -ne 0 ]]; then
  echo "Agent memory check FAILED"
  exit 1
fi

echo "Agent memory check OK (${#REQUIRED[@]} files)"
#!/usr/bin/env bash
# Copy agent scaffolding into current repo (non-Grok bootstrap).
set -euo pipefail

SOURCE="${SCAFFOLD_SOURCE:-$(cd "$(dirname "$0")/.." && pwd)}"
TARGET="${1:-.}"
TARGET="$(cd "$TARGET" && pwd)"
FORCE="${FORCE:-0}"

copy_file() {
  local src="$1" dst="$2"
  if [[ -f "$dst" && "$FORCE" != "1" ]]; then
    echo "SKIP (exists): $dst"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
  echo "COPY: $dst"
}

copy_tree() {
  local src="$1" dst="$2"
  if [[ -e "$dst" && "$FORCE" != "1" ]]; then
    echo "SKIP (exists): $dst"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  cp -r "$src" "$dst"
  echo "COPY: $dst"
}

echo "Scaffold source: $SOURCE"
echo "Target: $TARGET"

copy_tree "$SOURCE/.grok" "$TARGET/.grok"
copy_tree "$SOURCE/.cursor" "$TARGET/.cursor"
copy_tree "$SOURCE/.github" "$TARGET/.github"

for f in AGENTS.md AGENT_INDEX.md AGENT_TEMPLATE.md CONTRIBUTING.md CLAUDE.md CHANGELOG.md; do
  copy_file "$SOURCE/$f" "$TARGET/$f"
done

mkdir -p "$TARGET/docs/plans" "$TARGET/contracts" "$TARGET/reviews" "$TARGET/scripts" "$TARGET/tests" "$TARGET/src"

for f in METHODOLOGY.md ADOPTION.md COMPLETENESS.md PRD.md SRD.md TASKLIST.md ROADMAP.md \
         QUICKSTART.md CASE_STUDY_ASTROSIM.md CUSTOMIZE_MONOREPO.md MCP_UI_VALIDATION.md COMPARE.md DECISIONS.md SHARE.md; do
  copy_file "$SOURCE/docs/$f" "$TARGET/docs/$f"
done
copy_file "$SOURCE/docs/plans/TEMPLATE.md" "$TARGET/docs/plans/TEMPLATE.md"
copy_file "$SOURCE/docs/plans/epic-example.md" "$TARGET/docs/plans/epic-example.md"

copy_file "$SOURCE/contracts/README.md" "$TARGET/contracts/README.md"
copy_file "$SOURCE/contracts/critic_review.schema.md" "$TARGET/contracts/critic_review.schema.md"
copy_file "$SOURCE/contracts/api.schema.template.json" "$TARGET/contracts/api.schema.template.json"

copy_file "$SOURCE/reviews/TEMPLATE.md" "$TARGET/reviews/TEMPLATE.md"
copy_file "$SOURCE/reviews/example-approved.md" "$TARGET/reviews/example-approved.md"
copy_file "$SOURCE/tests/AGENT.md" "$TARGET/tests/AGENT.md"
copy_file "$SOURCE/src/AGENT.md" "$TARGET/src/AGENT.md"

for f in check_agent_sync.sh check_coverage.sh integrity_check.sh scaffold_init.sh self_test.sh; do
  copy_file "$SOURCE/scripts/$f" "$TARGET/scripts/$f"
done
chmod +x "$TARGET/scripts/"*.sh 2>/dev/null || true

for f in package.json package-lock.json tsconfig.json vitest.config.ts playwright.config.ts; do
  copy_file "$SOURCE/$f" "$TARGET/$f"
done

copy_tree "$SOURCE/demo" "$TARGET/demo"
copy_tree "$SOURCE/e2e" "$TARGET/e2e"
mkdir -p "$TARGET/src/lib"
for f in greet.ts slug.ts greet.test.ts slug.test.ts; do
  copy_file "$SOURCE/src/lib/$f" "$TARGET/src/lib/$f"
done

echo ""
echo "Done. Next:"
echo "  1. npm ci && npm run validate   # optional — coverage + Playwright e2e"
echo "  2. Customize docs/PRD.md, AGENTS.md; monorepo → docs/CUSTOMIZE_MONOREPO.md"
echo "  3. bash scripts/check_agent_sync.sh"
echo "  4. /pdd-plan for first epic"
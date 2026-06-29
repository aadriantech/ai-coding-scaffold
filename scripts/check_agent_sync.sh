#!/usr/bin/env bash
# Verify core agent memory files exist.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

REQUIRED=(
  "AGENTS.md"
  "AGENT_INDEX.md"
  "contracts/README.md"
  "contracts/critic_review.schema.md"
  "docs/plans/TEMPLATE.md"
  "docs/METHODOLOGY.md"
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

echo "Agent memory check OK (${#REQUIRED[@]} core files)"
#!/usr/bin/env bash
# Pre-release integrity gate — extend per project.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "== Agent memory =="
bash scripts/check_agent_sync.sh

echo "== Test suite =="
# CUSTOMIZE: uncomment and adapt
# pytest -q
# npm test
# cargo test

echo "INTEGRITY OK"
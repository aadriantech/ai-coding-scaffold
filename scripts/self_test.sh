#!/usr/bin/env bash
# Verify scaffold can bootstrap a clean directory and pass sync + coverage checks.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
export PATH="${HOME}/.local/node/bin:${PATH}"

echo "== Self-test: scaffold_init into temp dir =="
SCAFFOLD_SOURCE="$ROOT" bash "$ROOT/scripts/scaffold_init.sh" "$TMP"

echo "== Self-test: check_agent_sync in bootstrapped dir =="
bash "$TMP/scripts/check_agent_sync.sh"

echo "== Self-test: npm ci + coverage in bootstrapped dir =="
(cd "$TMP" && npm ci && bash scripts/check_coverage.sh)

echo "SELF TEST OK"
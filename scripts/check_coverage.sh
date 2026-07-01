#!/usr/bin/env bash
# Enforce >= 90% unit test coverage for src/lib (Vitest thresholds).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MIN="${MIN_COVERAGE:-90}"

echo "=== Unit coverage (min ${MIN}%) ==="
cd "$ROOT"
npm run test:coverage 2>&1 | tail -25

echo "COVERAGE OK"
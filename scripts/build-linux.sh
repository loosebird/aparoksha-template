#!/usr/bin/env bash
set -euo pipefail

export APAROKSHA_FRAMEWORK="${APAROKSHA_FRAMEWORK:-ADWAITA}"
swift build -c release

ARCH="$(uname -m)"
OUT_DIR="dist/linux/${ARCH}"
mkdir -p "$OUT_DIR"
cp ".build/release/AparokshaStarter" "$OUT_DIR/AparokshaStarter"

echo "Built $OUT_DIR/AparokshaStarter"

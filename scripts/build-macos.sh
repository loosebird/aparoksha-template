#!/usr/bin/env bash
set -euo pipefail

export APAROKSHA_FRAMEWORK="${APAROKSHA_FRAMEWORK:-APPKIT}"

PRODUCT="${PRODUCT:-AparokshaStarter}"
CONFIGURATION="${CONFIGURATION:-release}"
OUTPUT_DIR="${OUTPUT_DIR:-dist/macos/universal}"

swift build -c "$CONFIGURATION" --arch arm64
swift build -c "$CONFIGURATION" --arch x86_64

ARM_BIN=".build/arm64-apple-macosx/${CONFIGURATION}/${PRODUCT}"
X64_BIN=".build/x86_64-apple-macosx/${CONFIGURATION}/${PRODUCT}"

mkdir -p "$OUTPUT_DIR"
lipo -create -output "$OUTPUT_DIR/$PRODUCT" "$ARM_BIN" "$X64_BIN"

file "$OUTPUT_DIR/$PRODUCT" || true
echo "Built $OUTPUT_DIR/$PRODUCT"

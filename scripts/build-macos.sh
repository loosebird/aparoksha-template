#!/usr/bin/env bash
set -euo pipefail

export APAROKSHA_FRAMEWORK="${APAROKSHA_FRAMEWORK:-APPKIT}"
SCHEME="${SCHEME:-AparokshaStarter}"
CONFIGURATION="${CONFIGURATION:-Release}"
DERIVED_DATA_PATH="${DERIVED_DATA_PATH:-.build/xcode}"
OUTPUT_DIR="${OUTPUT_DIR:-dist/macos/universal}"

xcodebuild \
  -scheme "$SCHEME" \
  -configuration "$CONFIGURATION" \
  -destination 'platform=macOS' \
  -derivedDataPath "$DERIVED_DATA_PATH" \
  ARCHS='arm64 x86_64' \
  ONLY_ACTIVE_ARCH=NO \
  build

mkdir -p "$OUTPUT_DIR"
cp "$DERIVED_DATA_PATH/Build/Products/$CONFIGURATION/AparokshaStarter" "$OUTPUT_DIR/AparokshaStarter"

file "$OUTPUT_DIR/AparokshaStarter" || true

echo "Built $OUTPUT_DIR/AparokshaStarter"

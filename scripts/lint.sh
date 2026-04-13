#!/usr/bin/env bash
set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

if ! command -v swiftformat >/dev/null 2>&1; then
  echo "swiftformat not found. Install it from https://github.com/nicklockwood/SwiftFormat"
  exit 1
fi

if ! command -v swiftlint >/dev/null 2>&1; then
  echo "swiftlint not found. Install it from https://github.com/realm/SwiftLint"
  exit 1
fi

swiftformat --lint .
swiftlint lint --strict --config .swiftlint.yml

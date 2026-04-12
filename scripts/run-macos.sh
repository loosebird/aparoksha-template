#!/usr/bin/env bash
set -euo pipefail

export APAROKSHA_FRAMEWORK="${APAROKSHA_FRAMEWORK:-APPKIT}"
swift run AparokshaStarter

#!/bin/bash
# Install sirial-killer from a git clone as a per-user LaunchAgent. No sudo needed.

set -eu

SRC="$(cd "$(dirname "$0")" && pwd)/bin/sirial-killer"
readonly SRC
readonly BIN=$HOME/Library/Scripts/sirial-killer

mkdir -p "$(dirname "$BIN")"
install -m 755 "$SRC" "$BIN"
exec "$BIN" install

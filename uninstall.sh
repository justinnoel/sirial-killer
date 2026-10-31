#!/bin/bash
# Remove a git-clone install of sirial-killer. Siri's hotkey stays off until
# you turn it back on in System Settings.

set -eu

readonly LABEL=io.github.justinnoel.sirial-killer
readonly BIN=$HOME/Library/Scripts/sirial-killer

if [[ -x "$BIN" ]]; then
  "$BIN" uninstall
else
  launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null || true
  rm -f "$HOME/Library/LaunchAgents/$LABEL.plist"
  echo "Uninstalled."
fi
rm -f "$BIN"

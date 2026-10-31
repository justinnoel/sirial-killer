#!/bin/bash
# Remove the sirial-killer LaunchAgent. Siri's hotkey stays off until
# you turn it back on in System Settings.

set -eu

readonly LABEL=io.github.justinnoel.sirial-killer

launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null || true
rm -f "$HOME/Library/LaunchAgents/$LABEL.plist" "$HOME/Library/Scripts/sirial-killer"

echo "Uninstalled."

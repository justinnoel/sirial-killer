#!/bin/bash
# Remove the keep-cmd-shift-space LaunchAgent. Siri's hotkey stays off until
# you turn it back on in System Settings.

set -eu

readonly LABEL=io.github.justinnoel.keep-cmd-shift-space

launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null || true
rm -f "$HOME/Library/LaunchAgents/$LABEL.plist" "$HOME/Library/Scripts/keep-cmd-shift-space"

echo "Uninstalled."

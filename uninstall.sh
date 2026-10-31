#!/bin/bash
# Remove a git-clone install of sirial-killer. Siri's hotkey stays off until
# you turn it back on in System Settings.
#
# Does the work itself rather than calling `sirial-killer uninstall`, because
# the installed copy may be an older version without that command.

set -eu

readonly LABEL=io.github.justinnoel.sirial-killer

launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null || true
rm -f "$HOME/Library/LaunchAgents/$LABEL.plist" "$HOME/Library/Scripts/sirial-killer"

echo "Uninstalled. Siri's shortcut stays off until you turn it back on in System Settings."

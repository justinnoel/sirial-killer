#!/bin/bash
# Install keep-cmd-shift-space as a per-user LaunchAgent. No sudo needed.

set -eu

readonly LABEL=io.github.justinnoel.keep-cmd-shift-space
SRC="$(cd "$(dirname "$0")" && pwd)/bin/keep-cmd-shift-space"
readonly SRC
readonly BIN=$HOME/Library/Scripts/keep-cmd-shift-space
readonly PLIST=$HOME/Library/LaunchAgents/$LABEL.plist
DOMAIN=gui/$(id -u)
readonly DOMAIN

mkdir -p "$(dirname "$BIN")" "$(dirname "$PLIST")"
install -m 755 "$SRC" "$BIN"

cat >"$PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>$LABEL</string>
  <key>ProgramArguments</key>
  <array><string>$BIN</string></array>
  <key>WatchPaths</key>
  <array><string>$HOME/Library/Preferences/com.apple.symbolichotkeys.plist</string></array>
  <key>StartInterval</key><integer>300</integer>
  <key>RunAtLoad</key><true/>
</dict>
</plist>
EOF
plutil -lint -s "$PLIST"

launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
launchctl bootstrap "$DOMAIN" "$PLIST"

echo "Installed. Cmd+Shift+Space is yours again."
"$BIN"

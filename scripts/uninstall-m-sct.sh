#!/usr/bin/env bash
set -euo pipefail

rm -f "$HOME/.local/bin/m-sct-mark"

if [ -f "$HOME/.xbindkeysrc" ]; then
    grep -v 'm-sct-mark' "$HOME/.xbindkeysrc" > "$HOME/.xbindkeysrc.tmp" || true
    mv "$HOME/.xbindkeysrc.tmp" "$HOME/.xbindkeysrc"
fi

killall xbindkeys 2>/dev/null || true
xbindkeys

echo "m-sct uninstalled."

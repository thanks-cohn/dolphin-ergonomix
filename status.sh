#!/usr/bin/env bash
set -euo pipefail

echo "=== Dolphin Ergonomix Status ==="

echo

if [ -f "$HOME/.local/bin/1up" ]; then
    echo "[OK] ~/.local/bin/1up"
else
    echo "[MISSING] ~/.local/bin/1up"
fi

if [ -f "$HOME/.local/share/kio/servicemenus/1up.desktop" ]; then
    echo "[OK] Dolphin service menu"
else
    echo "[MISSING] Dolphin service menu"
fi

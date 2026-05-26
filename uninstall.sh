#!/usr/bin/env bash
set -euo pipefail

rm -f "$HOME/.local/bin/1up"
rm -f "$HOME/.local/share/kio/servicemenus/1up.desktop"

kbuildsycoca6 >/dev/null 2>&1 || true

echo "Dolphin Ergonomix removed."

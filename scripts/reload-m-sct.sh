#!/usr/bin/env bash
set -euo pipefail

killall xbindkeys 2>/dev/null || true
xbindkeys

echo "Reloaded xbindkeys."

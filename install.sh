#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share/kio/servicemenus"

cat > "$HOME/.local/bin/1up" <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

ACTION="${1:-}"
shift || true

case "$ACTION" in
move-up)
    for path in "$@"; do
        parent="$(dirname "$path")"
        grandparent="$(dirname "$parent")"
        mv "$path" "$grandparent/"
    done
    ;;

copy-locations)
    printf '%s\n' "$@" | xclip -selection clipboard
    ;;

*)
    echo "unknown action"
    exit 1
    ;;
esac
SCRIPT

chmod +x "$HOME/.local/bin/1up"

cat > "$HOME/.local/share/kio/servicemenus/1up.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Service
MimeType=all/allfiles;
Actions=OneUpMove;OneUpCopy;
X-KDE-ServiceTypes=KonqPopupMenu/Plugin

[Desktop Action OneUpMove]
Name=1UP: Move Up One Directory
Icon=go-up
Exec=/home/big-bro/.local/bin/1up move-up %F

[Desktop Action OneUpCopy]
Name=1UP: Copy File Location(s)
Icon=edit-copy
Exec=/home/big-bro/.local/bin/1up copy-locations %F
DESKTOP

kbuildsycoca6 >/dev/null 2>&1 || true

echo
echo "Dolphin Ergonomix installed."
echo "Restart Dolphin if needed."

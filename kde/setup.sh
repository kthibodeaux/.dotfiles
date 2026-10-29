# vi: set ft=sh :

# plasma major version: 5 or 6. override with PLASMA=5 ./setup.sh
PLASMA=${PLASMA:-$(plasmashell --version 2>/dev/null | grep -oE '[0-9]+' | head -1)}
case "$PLASMA" in
  5|6) ;;
  *) echo "can't detect plasma version, set PLASMA=5 or PLASMA=6"; exit 1 ;;
esac

APPLICATION_TITLE_BAR_VERSION=v0.10.0

if [ -d ~/.local/share/kwin/scripts/krohnkite ]; then
  echo "skipping install krohnkite: already installed"
elif [ "$PLASMA" = 5 ]; then
  # krohnkite 0.9+ is kwin 6 only and v0.8.2 has no release asset, so build it
  # (needs git, make and npm)
  tmp=$(mktemp -d)
  git clone --depth 1 --branch v0.8.2 https://github.com/anametologin/krohnkite "$tmp/krohnkite"
  make -C "$tmp/krohnkite" package \
    && kpackagetool5 --type KWin/Script --install "$tmp"/krohnkite/krohnkite-*.kwinscript \
    || { echo "krohnkite build/install failed (kept $tmp)"; exit 1; }
  rm -rf "$tmp"
else
  KROHNKITE_VERSION=0.9.9.2
  tmp=$(mktemp -d)
  curl -fLo "$tmp/krohnkite.kwinscript" "https://github.com/anametologin/krohnkite/releases/download/$KROHNKITE_VERSION/krohnkite.kwinscript"
  kpackagetool6 --type KWin/Script --install "$tmp/krohnkite.kwinscript"
  rm -rf "$tmp"
fi

# active window's title and buttons on the panel, since tiled windows have no
# titlebar (krohnkite noTileBorder). the plasmoid is qt6 only.
if [ "$PLASMA" = 5 ]; then
  echo "skipping install application-title-bar: needs plasma 6"
elif [ -d ~/.local/share/plasma/plasmoids/com.github.antroids.application-title-bar ]; then
  echo "skipping install application-title-bar: already installed"
else
  tmp=$(mktemp -d)
  curl -fLo "$tmp/application-title-bar.plasmoid" "https://github.com/antroids/application-title-bar/releases/download/$APPLICATION_TITLE_BAR_VERSION/application-title-bar.plasmoid"
  kpackagetool6 --type Plasma/Applet --install "$tmp/application-title-bar.plasmoid"
  rm -rf "$tmp"
fi

# sway-style "move container to workspace N; workspace N" - kwin has no
# built-in action that moves a window and follows it. --upgrade keeps an
# existing install in sync with the repo copy. kwin 5 has its own scripting api.
pkg="$(dirname "$0")/move-and-follow"
[ "$PLASMA" = 5 ] && pkg="$(dirname "$0")/plasma5/move-and-follow"
kpackagetool$PLASMA --type KWin/Script --upgrade "$pkg" >/dev/null 2>&1 \
  || kpackagetool$PLASMA --type KWin/Script --install "$pkg"

# sway-style region screenshots, launched as custom commands
command -v spectacle >/dev/null || echo "warning: spectacle not installed, screenshot shortcuts won't work"
mkdir -p ~/.local/share/applications
for f in "$(dirname "$0")"/screenshot-region-*.desktop; do
  # -k (release-capture) is newer than the spectacle that ships with plasma 5
  if [ "$PLASMA" = 5 ]; then
    sed 's/ -k / /' "$f" > ~/.local/share/applications/"$(basename "$f")"
  else
    cp "$f" ~/.local/share/applications/
  fi
done

kwin() { kwriteconfig$PLASMA --file kwinrc --group "$1" --key "$2" "$3"; }

kwin Desktops Number 10
kwin Desktops Rows 1
kwin Plugins krohnkiteEnabled true
kwin Plugins move-and-followEnabled true
kwin Plugins slideEnabled false
kwin Windows FocusPolicy FocusFollowsMouse
kwin Windows DelayFocusInterval 0
kwin Script-krohnkite monocleMaximize false
kwin Script-krohnkite noTileBorder true
for side in Between Bottom Left Right Top; do
  kwin Script-krohnkite "screenGap$side" 5
done

# values are "current,default,friendly name" - kwriteconfig$PLASMA does the escaping,
# so a literal comma key is written as "\," and backslash as "\\".
sc() { kwriteconfig$PLASMA --file kglobalshortcutsrc --group "$1" --key "$2" "$3"; }

# kglobalaccel keeps the shortcuts in memory and rewrites the file, which drops
# edits made while it runs. stop it for the writes, start it again at the end.
if [ "$PLASMA" = 5 ]; then
  systemctl --user stop plasma-kglobalaccel.service
fi

if [ "$PLASMA" = 5 ]; then
# krohnkite 0.8 names its shortcuts "Krohnkite: <Action>", 0.9 uses ids like KrohnkiteFocusLeft
for k in Decrease FloatAll FocusDown FocusLeft FocusNext FocusPrev FocusRight FocusUp GrowHeight Increase NextLayout PreviousLayout Rotate RotatePart SetMaster ShiftDown ShiftLeft ShiftRight ShiftUp ShrinkHeight ShrinkWidth TileLayout ToggleFloat growWidth; do
  kwriteconfig5 --file kglobalshortcutsrc --group kwin --key "Krohnkite$k" --delete
done

sc kwin 'Krohnkite: Decrease'        'Meta+Shift+I,none,'
sc kwin 'Krohnkite: Float All'       'Meta+Shift+F,none,'
sc kwin 'Krohnkite: Down/Next'       'Meta+J,none,'
sc kwin 'Krohnkite: Left'            'Meta+H,none,'
sc kwin 'Krohnkite: Right'           'Meta+L,none,'
sc kwin 'Krohnkite: Up/Prev'         'Meta+K,none,'
sc kwin 'Krohnkite: Grow Height'     'Meta+Ctrl+J,none,'
sc kwin 'Krohnkite: Grow Width'      'Meta+Ctrl+L,none,'
sc kwin 'Krohnkite: Shrink Height'   'Meta+Ctrl+K,none,'
sc kwin 'Krohnkite: Shrink Width'    'Meta+Ctrl+H,none,'
sc kwin 'Krohnkite: Increase'        'Meta+I,none,'
sc kwin 'Krohnkite: Next Layout'     'Meta+\\,none,'
sc kwin 'Krohnkite: Previous Layout' 'Meta+|,none,'
sc kwin 'Krohnkite: Rotate'          'Meta+R,none,'
sc kwin 'Krohnkite: Rotate Part'     'Meta+Shift+R,none,'
sc kwin 'Krohnkite: Move Down/Next'  'Meta+Shift+J,none,'
sc kwin 'Krohnkite: Move Left'       'Meta+Shift+H,none,'
sc kwin 'Krohnkite: Move Right'      'Meta+Shift+L,none,'
sc kwin 'Krohnkite: Move Up/Prev'    'Meta+Shift+K,none,'
sc kwin 'Krohnkite: Float'           'Meta+F,none,'
sc kwin 'Krohnkite: Tile Layout'     'Meta+T,none,'
# krohnkite's defaults for these are Meta+Return and Meta+M
sc kwin 'Krohnkite: Set master'      'Meta+M,none,'
sc kwin 'Krohnkite: Monocle Layout'  'none,none,'
else
  sc kwin KrohnkiteDecrease        'Meta+Shift+I,none,Krohnkite: Decrease'
  sc kwin KrohnkiteFloatAll        'Meta+Shift+F,none,Krohnkite: Toggle Float All'
  sc kwin KrohnkiteFocusDown       'Meta+J,none,Krohnkite: Focus Down'
  sc kwin KrohnkiteFocusLeft       'Meta+H,none,Krohnkite: Focus Left'
  sc kwin KrohnkiteFocusNext       'Meta+.,none,Krohnkite: Focus Next'
  sc kwin KrohnkiteFocusPrev       'Meta+\,,none,Krohnkite: Focus Previous'
  sc kwin KrohnkiteFocusRight      'Meta+L,none,Krohnkite: Focus Right'
  sc kwin KrohnkiteFocusUp         'Meta+K,none,Krohnkite: Focus Up'
  sc kwin KrohnkiteGrowHeight      'Meta+Ctrl+J,none,Krohnkite: Grow Height'
  sc kwin KrohnkiteIncrease        'Meta+I,none,Krohnkite: Increase'
  sc kwin KrohnkiteNextLayout      'Meta+\\,none,Krohnkite: Next Layout'
  sc kwin KrohnkitePreviousLayout  'Meta+|,none,Krohnkite: Previous Layout'
  sc kwin KrohnkiteRotate          'Meta+R,none,Krohnkite: Rotate'
  sc kwin KrohnkiteRotatePart      'Meta+Shift+R,none,Krohnkite: Rotate Part'
  sc kwin KrohnkiteSetMaster       'Meta+M,none,Krohnkite: Set master'
  sc kwin KrohnkiteShiftDown       'Meta+Shift+J,none,Krohnkite: Move Down/Next'
  sc kwin KrohnkiteShiftLeft       'Meta+Shift+H,none,Krohnkite: Move Left'
  sc kwin KrohnkiteShiftRight      'Meta+Shift+L,none,Krohnkite: Move Right'
  sc kwin KrohnkiteShiftUp         'Meta+Shift+K,none,Krohnkite: Move Up/Prev'
  sc kwin KrohnkiteShrinkHeight    'Meta+Ctrl+K,none,Krohnkite: Shrink Height'
  sc kwin KrohnkiteShrinkWidth     'Meta+Ctrl+H,none,Krohnkite: Shrink Width'
  sc kwin KrohnkiteTileLayout      'Meta+T,none,Krohnkite: Tile Layout'
  sc kwin KrohnkiteToggleFloat     'Meta+F,none,Krohnkite: Toggle Float'
  sc kwin KrohnkitegrowWidth       'Meta+Ctrl+L,none,Krohnkite: Grow Width'
fi

sc kwin 'Window Close'           'Meta+Q,Alt+F4,Close Window'
# krohnkite owns Meta+T and Meta+L
sc kwin 'Edit Tiles'             'none,Meta+T,Toggle Tiles Editor'
sc ksmserver 'Lock Session'      "$(printf 'Screensaver,Screensaver\tMeta+L,Lock Session')"
# Meta+D is the krunner launcher, like rofi drun in sway
sc kwin 'Show Desktop'           'none,Meta+D,Peek at Desktop'
sc kwin view_actual_size         'none,Meta+0,Zoom to Actual Size'

sc kwin 'Switch to Desktop 1'    "$(printf 'Meta+1,Ctrl+F1\tMeta+F1,Switch to Desktop 1')"
sc kwin 'Switch to Desktop 2'    "$(printf 'Meta+2,Ctrl+F2\tMeta+F2,Switch to Desktop 2')"
sc kwin 'Switch to Desktop 3'    "$(printf 'Meta+3,Ctrl+F3\tMeta+F3,Switch to Desktop 3')"
sc kwin 'Switch to Desktop 4'    "$(printf 'Meta+4,Ctrl+F4\tMeta+F4,Switch to Desktop 4')"
for n in 5 6 7 8 9; do
  sc kwin "Switch to Desktop $n" "Meta+$n,none,Switch to Desktop $n"
done
sc kwin 'Switch to Desktop 10'   'Meta+0,none,Switch to Desktop 10'
# Meta+Ctrl+N goes to move-and-follow instead of the built-in move
for n in 1 2 3 4 5 6 7 8 9 10; do
  sc kwin "Window to Desktop $n" "none,none,Window to Desktop $n"
  sc kwin "MoveAndFollow$n" "Meta+Ctrl+$((n % 10)),Meta+Ctrl+$((n % 10)),Move Window to Desktop $n and Follow"
done

# free Meta+1..9 from the task manager so they can switch desktops
for n in 1 2 3 4 5 6 7 8 9; do
  sc plasmashell "activate task manager entry $n" "none,Meta+$n,Activate Task Manager Entry $n"
done
sc plasmashell 'manage activities'   'none,Meta+Q,Show Activity Switcher'
sc plasmashell 'next activity'       'Meta+A,none,Walk through activities'
sc plasmashell 'previous activity'   'Meta+Shift+A,none,Walk through activities (Reverse)'

# plasma 6 keeps launcher shortcuts in a [services][<desktop file>] group,
# plasma 5 in a top-level [<desktop file>] group with a current,default,name
# value. $3 is the default keys, if they differ from the current ones.
sc_cmd() {
  if [ "$PLASMA" = 5 ]; then
    kwriteconfig5 --file kglobalshortcutsrc --group "$1" --key _k_friendly_name "$1"
    kwriteconfig5 --file kglobalshortcutsrc --group "$1" --key _launch "$2,${3:-$2},$1"
  else
    kwriteconfig6 --file kglobalshortcutsrc --group services --group "$1" --key _launch "$2"
  fi
}
sc_unlaunch() {
  if [ "$PLASMA" = 5 ]; then
    kwriteconfig5 --file kglobalshortcutsrc --group "$1" --key _launch --delete
  else
    kwriteconfig6 --file kglobalshortcutsrc --group services --group "$1" --key _launch --delete
  fi
}

sc_cmd org.kde.krunner.desktop "$(printf 'Meta+D\tAlt+Space\tAlt+F2\tSearch')" "$(printf 'Alt+Space\tAlt+F2\tSearch')"
# first terminal that's installed gets Meta+Return, preferring alacritty. the
# desktop file id differs per distro/package. unbind the rest so they don't
# fight over the key.
bound=
for id in Alacritty com.alacritty.Alacritty foot; do
  if [ -z "$bound" ] && { [ -f "/usr/share/applications/$id.desktop" ] || [ -f ~/.local/share/applications/$id.desktop ]; }; then
    sc_cmd "$id.desktop" Meta+Return
    bound=1
  else
    sc_unlaunch "$id.desktop"
  fi
done
sc_cmd screenshot-region-save.desktop Meta+X
sc_cmd screenshot-region-copy.desktop Meta+Z

if [ "$PLASMA" = 5 ]; then
  systemctl --user start plasma-kglobalaccel.service
  sleep 1
  qdbus org.kde.KWin /KWin reconfigure
fi

gdbus call --session --dest org.kde.plasmashell --object-path /PlasmaShell \
  --method org.kde.PlasmaShell.evaluateScript "$(cat "$(dirname "$0")/panel.js")" >/dev/null

echo "done - log out and back in to load the shortcuts and krohnkite"

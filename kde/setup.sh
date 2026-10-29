# vi: set ft=sh :

KROHNKITE_VERSION=0.9.9.2
APPLICATION_TITLE_BAR_VERSION=v0.10.0

if [ -d ~/.local/share/kwin/scripts/krohnkite ]; then
  echo "skipping install krohnkite: already installed"
else
  tmp=$(mktemp -d)
  curl -fLo "$tmp/krohnkite.kwinscript" "https://github.com/anametologin/krohnkite/releases/download/$KROHNKITE_VERSION/krohnkite.kwinscript"
  kpackagetool6 --type KWin/Script --install "$tmp/krohnkite.kwinscript"
  rm -rf "$tmp"
fi

# active window's title and buttons on the panel, since tiled windows have no
# titlebar (krohnkite noTileBorder)
if [ -d ~/.local/share/plasma/plasmoids/com.github.antroids.application-title-bar ]; then
  echo "skipping install application-title-bar: already installed"
else
  tmp=$(mktemp -d)
  curl -fLo "$tmp/application-title-bar.plasmoid" "https://github.com/antroids/application-title-bar/releases/download/$APPLICATION_TITLE_BAR_VERSION/application-title-bar.plasmoid"
  kpackagetool6 --type Plasma/Applet --install "$tmp/application-title-bar.plasmoid"
  rm -rf "$tmp"
fi

# sway-style "move container to workspace N; workspace N" - kwin has no
# built-in action that moves a window and follows it. --upgrade keeps an
# existing install in sync with the repo copy.
pkg="$(dirname "$0")/move-and-follow"
kpackagetool6 --type KWin/Script --upgrade "$pkg" >/dev/null 2>&1 \
  || kpackagetool6 --type KWin/Script --install "$pkg"

# sway-style region screenshots, launched as custom commands
mkdir -p ~/.local/share/applications
cp "$(dirname "$0")"/screenshot-region-*.desktop ~/.local/share/applications/

kwin() { kwriteconfig6 --file kwinrc --group "$1" --key "$2" "$3"; }

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

# values are "current,default,friendly name" - kwriteconfig6 does the escaping,
# so a literal comma key is written as "\," and backslash as "\\".
sc() { kwriteconfig6 --file kglobalshortcutsrc --group "$1" --key "$2" "$3"; }

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

sc_cmd() { kwriteconfig6 --file kglobalshortcutsrc --group services --group "$1" --key _launch "$2"; }

sc_cmd org.kde.krunner.desktop "$(printf 'Meta+D\tAlt+Space\tAlt+F2\tSearch')"
sc_cmd foot.desktop Meta+Return
sc_cmd screenshot-region-save.desktop Meta+X
sc_cmd screenshot-region-copy.desktop Meta+Z

gdbus call --session --dest org.kde.plasmashell --object-path /PlasmaShell \
  --method org.kde.PlasmaShell.evaluateScript "$(cat "$(dirname "$0")/panel.js")" >/dev/null

echo "done - log out and back in to load the shortcuts and krohnkite"

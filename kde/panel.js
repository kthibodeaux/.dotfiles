// plasma desktop script - run via org.kde.PlasmaShell.evaluateScript.
// replaces every panel with three top panels sized to their
// content, so the menu bar stays centered however wide the sides get.
panels().forEach(p => p.remove());

function topPanel(alignment) {
  const panel = new Panel;
  panel.location = "top";
  panel.height = 46;
  panel.floating = false;
  panel.alignment = alignment;
  panel.lengthMode = "fit";
  panel.hiding = "none";
  return panel;
}

// desktops on the left
topPanel("left").addWidget("org.kde.plasma.pager");

// the active window's menu bar in the middle
topPanel("center").addWidget("org.kde.plasma.appmenu");

// tray, the fullscreen app launcher and clock on the right
const right = topPanel("right");
right.addWidget("org.kde.plasma.systemtray");
right.addWidget("org.kde.plasma.kickerdash").globalShortcut = "Meta+D";
const clock = right.addWidget("org.kde.plasma.digitalclock");
clock.currentConfigGroup = ["Appearance"];
clock.writeConfig("autoFontAndSize", false);
clock.writeConfig("fontFamily", "Kumbh Sans");
clock.writeConfig("fontSize", 12);
clock.writeConfig("fontWeight", 400);
clock.writeConfig("fontStyleName", "Regular");
clock.writeConfig("dateDisplayFormat", "BesideTime");
clock.writeConfig("dateFormat", "longDate");

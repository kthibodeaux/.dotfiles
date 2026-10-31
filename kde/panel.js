// plasma desktop script - run via org.kde.PlasmaShell.evaluateScript.
// replaces every panel with three top panels sized to their
// content, so the desktops stay centered however wide the left side gets.
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

// the active window's title and menu bar on the left
const left = topPanel("left");
// the plasmoid is plasma 6 only, so it's missing on plasma 5
const titleBar = left.addWidget("com.github.antroids.application-title-bar");
if (titleBar) {
  titleBar.currentConfigGroup = ["Appearance"];
  titleBar.writeConfig("widgetElements", ["windowTitle"]);
}
left.addWidget("org.kde.plasma.appmenu");

// desktops in the middle
topPanel("center").addWidget("org.kde.plasma.pager");

// tray, clock and launcher on the right
const right = topPanel("right");
right.addWidget("org.kde.plasma.systemtray");
right.addWidget("org.kde.plasma.digitalclock");
right.addWidget("org.kde.plasma.kickoff");

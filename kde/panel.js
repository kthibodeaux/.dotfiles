// plasma desktop script - run via org.kde.PlasmaShell.evaluateScript.
// replaces every panel with a single floating top panel.
panels().forEach(p => p.remove());

const panel = new Panel;
panel.location = "top";
panel.height = 46;
panel.floating = true;
panel.alignment = "center";
panel.lengthMode = "fill";
panel.hiding = "none";

// launcher, desktops and the active window's title and menu bar on the left,
// the spacer pushes tray and clock right
panel.addWidget("org.kde.plasma.kickoff");
panel.addWidget("org.kde.plasma.pager");

const titleBar = panel.addWidget("com.github.antroids.application-title-bar");
titleBar.currentConfigGroup = ["Appearance"];
titleBar.writeConfig("widgetElements", ["windowTitle"]);
panel.addWidget("org.kde.plasma.appmenu");

panel.addWidget("org.kde.plasma.panelspacer");
panel.addWidget("org.kde.plasma.systemtray");
panel.addWidget("org.kde.plasma.digitalclock");

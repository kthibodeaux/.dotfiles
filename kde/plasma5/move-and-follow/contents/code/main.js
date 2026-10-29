// plasma 5 / kwin 5 scripting api: desktops are 1-based numbers and the
// active window is workspace.activeClient
function moveAndFollow(n) {
  const client = workspace.activeClient;
  if (!client || n > workspace.desktops) return;

  client.desktop = n;
  workspace.currentDesktop = n;
  workspace.activeClient = client;
}

for (let n = 1; n <= 10; n++) {
  const key = n % 10;
  registerShortcut(
    `MoveAndFollow${n}`,
    `Move Window to Desktop ${n} and Follow`,
    `Meta+Ctrl+${key}`,
    () => moveAndFollow(n)
  );
}

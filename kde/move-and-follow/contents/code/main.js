function moveAndFollow(index) {
  const desktop = workspace.desktops[index];
  const window = workspace.activeWindow;
  if (!desktop || !window) return;

  window.desktops = [desktop];
  workspace.currentDesktop = desktop;
  workspace.activeWindow = window;
}

for (let n = 1; n <= 10; n++) {
  const key = n % 10;
  registerShortcut(
    `MoveAndFollow${n}`,
    `Move Window to Desktop ${n} and Follow`,
    `Meta+Ctrl+${key}`,
    () => moveAndFollow(n - 1)
  );
}

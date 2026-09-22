# vi: set ft=sh :

STATE_DIR="$HOME/.local/state/dotfiles"
RPMFUSION_TRACKED_MARKER="$STATE_DIR/rpmfusion-repo-tracked"

if rpm -q rpmfusion-free-release rpmfusion-nonfree-release > /dev/null 2>&1; then
  echo "skipping install rpmfusion: already installed"
else
  rpm-ostree install \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
  echo "rpmfusion installed, reboot required before continuing"
  exit 1
fi

# the URL install above pins rpmfusion-*-release to that exact version, so it
# never gets picked up by future `rpm-ostree upgrade` runs. re-adding it by
# name (now that its own repo is active) switches it to normal repo tracking.
if [ -f "$RPMFUSION_TRACKED_MARKER" ]; then
  echo "skipping rpmfusion repo-tracking fixup: already applied"
else
  rpm-ostree update \
    --uninstall rpmfusion-free-release \
    --uninstall rpmfusion-nonfree-release \
    --install rpmfusion-free-release \
    --install rpmfusion-nonfree-release
  mkdir -p "$STATE_DIR"
  touch "$RPMFUSION_TRACKED_MARKER"
  echo "rpmfusion repo-tracking fixup applied, reboot required before continuing"
  exit 1
fi

if rpm -q steam > /dev/null 2>&1; then
  echo "skipping install steam: already installed"
else
  rpm-ostree install steam
  echo "steam installed, reboot required before continuing"
  exit 1
fi

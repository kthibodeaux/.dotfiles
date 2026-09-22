# vi: set ft=sh :

if command -v distrobox > /dev/null; then
  echo "skipping install distrobox: already installed"
else
  rpm-ostree install distrobox
  echo "distrobox installed, reboot required before continuing"
  exit 1
fi

# vi: set ft=sh :

if rpm -q syncthing > /dev/null 2>&1; then
  echo "skipping install syncthing: already installed"
else
  rpm-ostree install syncthing
  echo "syncthing installed, reboot required before continuing"
  exit 1
fi

systemctl --user enable --now syncthing.service

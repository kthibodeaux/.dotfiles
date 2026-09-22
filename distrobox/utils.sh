# vi: set ft=sh :

if distrobox list --no-color 2>/dev/null | awk -F'|' '{gsub(/^ +| +$/,"",$2); print $2}' | grep -qx "utils"; then
  echo "skipping create devbox utils: already exists"
else
  distrobox create --name utils --image registry.fedoraproject.org/fedora-toolbox:latest --yes
fi

distrobox enter utils -- sudo dnf install -y stow

if [ -x ~/.local/bin/stow ]; then
  echo "skipping export stow: already exported"
else
  distrobox enter utils -- distrobox-export --bin /usr/bin/stow --export-path "$HOME/.local/bin"
fi

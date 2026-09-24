# vi: set ft=sh :

if distrobox list --no-color 2>/dev/null | awk -F'|' '{gsub(/^ +| +$/,"",$2); print $2}' | grep -qx "utils"; then
  echo "skipping create devbox utils: already exists"
else
  distrobox create --name utils --image registry.fedoraproject.org/fedora-toolbox:latest --yes
fi

distrobox enter utils -- sudo dnf install -y stow xfce4-settings git-delta

if [ -x ~/.local/bin/stow ]; then
  echo "skipping export stow: already exported"
else
  distrobox enter utils -- distrobox-export --bin /usr/bin/stow --export-path "$HOME/.local/bin"
fi

if [ -x ~/.local/bin/xfsettingsd ]; then
  echo "skipping export xfsettingsd: already exported"
else
  # provides the XSettings (icon theme, gtk theme, cursor) that Thunar and
  # other xfce/gtk apps read - see sway/.config/sway/config's startup section.
  distrobox enter utils -- distrobox-export --bin /usr/bin/xfsettingsd --export-path "$HOME/.local/bin"
fi

if [ -x ~/.local/bin/delta ]; then
  echo "skipping export delta: already exported"
else
  distrobox enter utils -- distrobox-export --bin /usr/bin/delta --export-path "$HOME/.local/bin"
fi

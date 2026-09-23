# vi: set ft=sh :

if [ -d ~/.local/share/themes/catppuccin-mocha-mauve-standard+default ]; then
  echo "skipping install catppuccin-mocha-mauve gtk theme: already installed"
else
  mkdir -p ~/.local/share/themes
  tmp=$(mktemp -d)
  curl -fLo "$tmp/theme.zip" "https://github.com/catppuccin/gtk/releases/latest/download/catppuccin-mocha-mauve-standard+default.zip"
  unzip -q "$tmp/theme.zip" -d ~/.local/share/themes
  rm -rf "$tmp"
fi

if [ -d ~/.local/share/icons/catppuccin-mocha-dark-cursors ]; then
  echo "skipping install catppuccin-mocha-dark cursors: already installed"
else
  mkdir -p ~/.local/share/icons
  tmp=$(mktemp -d)
  curl -fLo "$tmp/cursors.zip" "https://github.com/catppuccin/cursors/releases/latest/download/catppuccin-mocha-dark-cursors.zip"
  unzip -q "$tmp/cursors.zip" -d ~/.local/share/icons
  rm -rf "$tmp"
fi

if [ -d ~/.local/share/icons/Papirus-Dark ]; then
  echo "skipping install Papirus-Dark icon theme: already installed"
else
  # install to $HOME instead of the default /usr/share/icons - the latter is
  # part of the read-only ostree deployment on this host.
  DESTDIR="$HOME/.local/share/icons" EXTRA_THEMES="Papirus-Dark" \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh)"

  tmp=$(mktemp -d)
  git clone --depth 1 https://github.com/catppuccin/papirus-folders.git "$tmp"
  cp -r "$tmp/src/." ~/.local/share/icons/Papirus/
  rm -rf "$tmp"

  curl -fLo ~/.local/bin/papirus-folders https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/papirus-folders
  chmod +x ~/.local/bin/papirus-folders
  ~/.local/bin/papirus-folders -C cat-mocha-mauve --theme Papirus-Dark
fi

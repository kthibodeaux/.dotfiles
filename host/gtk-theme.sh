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

if [ -d ~/.local/share/icons/grey-dark ]; then
  echo "skipping install grey-dark icon theme: already installed"
else
  tmp=$(mktemp -d)
  git clone --depth 1 https://github.com/vinceliuice/Tela-icon-theme.git "$tmp"
  "$tmp/install.sh" -d ~/.local/share/icons grey

  # install.sh always prefixes with the theme name (defaults to "Tela", and
  # -n "" doesn't strip it - it falls back to the default since the
  # substitution it uses treats an empty value the same as unset). strip the
  # prefix and repoint the light/dark variants' relative symlinks, which
  # point at the standard variant's folder by name.
  cd ~/.local/share/icons
  for suffix in "" "-dark" "-light"; do
    mv "Tela-grey$suffix" "grey$suffix"
  done
  for suffix in "-dark" "-light"; do
    for link in "grey$suffix"/*; do
      [ -L "$link" ] || continue
      target=$(readlink "$link")
      case "$target" in
        *Tela-grey*) ln -sfn "${target/Tela-grey/grey}" "$link" ;;
      esac
    done
    gtk-update-icon-cache -f "grey$suffix"
  done
  gtk-update-icon-cache -f grey
  cd - > /dev/null

  rm -rf "$tmp"
fi

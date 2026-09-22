# vi: set ft=sh :

if [ -d ~/.local/share/fonts/HackNerdFont ]; then
  echo "skipping install Hack Nerd Font: already installed"
else
  mkdir -p ~/.local/share/fonts/HackNerdFont
  curl -fLo /tmp/Hack.tar.xz https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.tar.xz
  tar -xf /tmp/Hack.tar.xz -C ~/.local/share/fonts/HackNerdFont
  rm /tmp/Hack.tar.xz
  fc-cache -fv ~/.local/share/fonts
fi

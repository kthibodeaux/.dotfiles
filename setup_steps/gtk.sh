if [ -d ~/src/vimix-gtk-themes ]; then
  echo "skipping install gtk theme: already installed"
else
  cd ~/src
  git clone git@github.com:vinceliuice/vimix-gtk-themes.git
  cd vimix-gtk-themes
  ./Vimix-installer
  cd ~
fi

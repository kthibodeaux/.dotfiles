if [ -d ~/src/vimix-icon-theme ]; then
  echo "skipping install icons: already installed"
else
  cd ~/src
  git clone git@github.com:vinceliuice/vimix-icon-theme.git
  cd vimix-icon-theme
  ./install.sh
  cd ~
fi

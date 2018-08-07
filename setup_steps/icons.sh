if [ -d ~/opt/vimix-icon-theme ]; then
  echo "skipping install icons: already installed"
else
  cd ~/opt
  git clone git@github.com:vinceliuice/vimix-icon-theme.git
  cd vimix-icon-theme
  ./Installer.sh
  cd ~
fi

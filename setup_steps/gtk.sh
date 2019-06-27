if [ -d ~/src/numix-solarized-gtk-theme ]; then
  echo "skipping install gtk theme: already installed"
else
  cd ~/src
  git clone git@github.com:Ferdi265/numix-solarized-gtk-theme.git
  cd numix-solarized-gtk-theme
  sudo make THEME=SolarizedDarkGreen install
  cd ~
fi

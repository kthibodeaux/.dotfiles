if [ -d ~/src/feh ]; then
  echo "skipping install feh: already installed"
else
  cd ~/src
  git clone git@github.com:derf/feh.git
  cd feh
  make
  sudo make install
  cd ~
fi

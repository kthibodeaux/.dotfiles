if [ -d ~/opt/firefox ]; then
  echo "skipping firefox: already installed"
else
  cd ~/opt
  wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
  tar xvjf firefox.tar.bz2
  sudo ln -s /$HOME/opt/firefox/firefox-bin /usr/bin/firefox
  cd ~
fi

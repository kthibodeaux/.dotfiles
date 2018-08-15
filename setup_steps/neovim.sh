if [ -d ~/src/neovim-0.3.1 ]; then
  echo "skipping install neovim: already installed"
else
  cd ~/src
  wget -O neovim-0.3.1.tar.gz https://github.com/neovim/neovim/archive/v0.3.1.tar.gz
  tar xvzf neovim-0.3.1.tar.gz
  cd neovim-0.3.1
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  cd ~
fi

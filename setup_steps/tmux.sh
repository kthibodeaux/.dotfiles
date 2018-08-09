if [ -d ~/src/tmux-2.7 ]; then
  echo "skipping install tmux: already installed"
else
  cd ~/src
  wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
  tar xvzf tmux-2.7.tar.gz
  cd tmux-2.7
  ./configure && make && sudo make install
  cd ~
fi

if [ -d ~/.tmux/plugins/tmux-fingers ]; then
  echo "skipping tmux-fingers: already installed"
else
  git clone --recursive https://github.com/Morantron/tmux-fingers ~/.tmux/plugins/tmux-fingers
fi
echo ""

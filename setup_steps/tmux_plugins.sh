if [ -d ~/.tmux/plugins/tmux-fingers ]; then
  echo "skipping install tmux-fingers plugin: already installed"
else
  git clone --recursive https://github.com/Morantron/tmux-fingers ~/.tmux/plugins/tmux-fingers
fi

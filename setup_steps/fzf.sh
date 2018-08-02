if [ -d ~/.fzf ]; then
  echo "skipping fzf: already installed"
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --completion --no-update-rc
fi
echo ""

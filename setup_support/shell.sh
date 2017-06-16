set_default_shell() {
  if [ $SHELL == $1 ]; then
    echo "skipping change shell: shell is already $1"
  else
    echo "setting shell to /usr/bin/zsh"
    chsh -s /usr/bin/zsh
  fi
  echo ""
}

set_default_shell() {
  if [ $SHELL == $1 ]; then
    echo "skipping change shell: shell is already $1"
  else
    echo "setting shell to $1"
    chsh -s $1
  fi
  echo ""
}

set_default_shell "/usr/bin/zsh"

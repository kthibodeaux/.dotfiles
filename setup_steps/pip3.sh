pip3_install() {
  if pip3 show $1 > /dev/null; then
    echo "skipping pip3 $1: already installed"
  else
    sudo pip3 install $1
  fi
  echo ""
}

pip3_install "hangups"
pip3_install "neovim"
pip3_install "rtv"

pip2_install() {
  if pip2 show $1 > /dev/null; then
    echo "skipping pip2 $1: already installed"
  else
    sudo pip2 install $1
  fi
  echo ""
}

pip2_install "websocket-client"

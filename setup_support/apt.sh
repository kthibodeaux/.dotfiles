apt_install() {
  if dpkg -s $1 > /dev/null; then
    echo "skipping $1: already installed"
  else
    sudo apt-get -y install $1
  fi
}

add_apt_source() {
  if [ -f $1 ]; then
    echo "skipping $1: already exists"
  else
    echo $2 | sudo tee -a $1
  fi
}

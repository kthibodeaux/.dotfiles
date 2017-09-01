snap_install() {
  if snap list $2 > /dev/null; then
    echo "skipping $2: already installed"
  else
    sudo snap install $1 $2
  fi
}

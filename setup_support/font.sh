font_install() {
  if [ -f "$HOME/.fonts/$1" ]; then
    echo "skipping $1: already installed"
  else
    wget -O "$HOME/.fonts/$1" "$2"
  fi
}

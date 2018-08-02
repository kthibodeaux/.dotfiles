font_install() {
  if [ -f "$HOME/.fonts/$1" ]; then
    echo "skipping $1: already installed"
  else
    wget -O "$HOME/.fonts/$1" "$2"
  fi
}

mkdir ~/.fonts

font_install "fontawesome-webfont.ttf" "https://github.com/FortAwesome/Font-Awesome/raw/master/fonts/fontawesome-webfont.ttf"
font_install "System San Francisco Display Bold.ttf" "https://github.com/supermarin/YosemiteSanFranciscoFont/raw/master/System%20San%20Francisco%20Display%20Bold.ttf"
font_install "System San Francisco Display Ultralight.ttf" "https://github.com/supermarin/YosemiteSanFranciscoFont/raw/master/System%20San%20Francisco%20Display%20Ultralight.ttf"
font_install "System San Francisco Display Regular.ttf" "https://github.com/supermarin/YosemiteSanFranciscoFont/raw/master/System%20San%20Francisco%20Display%20Regular.ttf"
font_install "System San Francisco Display Thin.ttf" "https://github.com/supermarin/YosemiteSanFranciscoFont/raw/master/System%20San%20Francisco%20Display%20Thin.ttf"
font_install "Menlo Regular.ttf" "https://github.com/hbin/top-programming-fonts/raw/master/Menlo-Regular.ttf"

echo "updating font cache"
sudo fc-cache -f

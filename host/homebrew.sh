# vi: set ft=sh :

if command -v brew > /dev/null 2>&1; then
  echo "skipping install homebrew: already installed"
else
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

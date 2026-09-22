# vi: set ft=sh :

if distrobox list --no-color 2>/dev/null | awk -F'|' '{gsub(/^ +| +$/,"",$2); print $2}' | grep -qx "dev"; then
  echo "skipping create devbox dev: already exists"
else
  distrobox create --name dev --image archlinux:latest --yes
fi

# fresh arch images can have a stale package-signing keyring, which fails
# signature verification on everything else until refreshed first.
distrobox enter dev -- sudo pacman -Sy --noconfirm archlinux-keyring
distrobox enter dev -- sudo pacman -Syu --noconfirm

distrobox enter dev -- sudo pacman -S --noconfirm --needed \
  zsh \
  tmux \
  git \
  ripgrep \
  fd \
  base-devel \
  unzip \
  tree-sitter-cli \
  fzf \
  go \
  nodejs \
  npm \
  golangci-lint \
  docker \
  docker-compose

# chsh goes through PAM, whose service files are stripped out of minimal
# arch container images, so it denies the change even with a valid shell.
# usermod edits /etc/passwd directly as root, bypassing that entirely.
distrobox enter dev -- sudo usermod -s /usr/bin/zsh "$USER"

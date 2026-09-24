# vi: set ft=sh :

if distrobox list --no-color 2>/dev/null | awk -F'|' '{gsub(/^ +| +$/,"",$2); print $2}' | grep -qx "dev"; then
  echo "skipping create devbox dev: already exists"
else
  # --group-add keep-groups passes host supplementary groups (e.g. dialout/uucp)
  # straight through without user-namespace remapping, needed for serial device
  # access (Arduino/esptool). Some distrobox/podman versions don't add this by
  # default, so it's made explicit here.
  distrobox create --name dev --image archlinux:latest --additional-flags "--group-add keep-groups" --yes
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
  docker-compose \
  bat \
  watchexec \
  git-delta \
  just \
  direnv \
  tig \
  tmate \
  jq \
  go-yq \
  shellcheck \
  httpie \
  delve \
  gum \
  avr-gcc \
  avr-libc \
  teensy_loader_cli \
  arduino-cli \
  libyaml

# chsh goes through PAM, whose service files are stripped out of minimal
# arch container images, so it denies the change even with a valid shell.
# usermod edits /etc/passwd directly as root, bypassing that entirely.
distrobox enter dev -- sudo usermod -s /usr/bin/zsh "$USER"

if distrobox enter dev -- command -v lazydocker > /dev/null 2>&1; then
  echo "skipping install lazydocker: already installed"
else
  distrobox enter dev -- go install github.com/jesseduffield/lazydocker@latest
fi

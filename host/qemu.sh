# vi: set ft=sh :

if ! command -v brew > /dev/null 2>&1; then
  echo "homebrew not installed - run host/homebrew.sh first"
  exit 1
fi

if brew list qemu > /dev/null 2>&1; then
  echo "skipping install qemu: already installed"
else
  brew install qemu
fi

if brew list docker > /dev/null 2>&1; then
  echo "skipping install docker: already installed"
else
  brew install docker
fi

if brew list docker-engine > /dev/null 2>&1; then
  echo "skipping install docker-engine: already installed"
else
  brew install docker-engine
fi

# the udev rule that grants /dev/kvm to the "kvm" group ships with the base
# system, but silently no-ops if that group doesn't exist yet - create it
# ourselves rather than relying on a distro qemu package to do it.
if getent group kvm > /dev/null 2>&1; then
  echo "skipping create kvm group: already exists"
else
  sudo groupadd kvm
fi

if groups | grep -qw kvm; then
  echo "skipping kvm group membership: already a member"
else
  sudo usermod -aG kvm "$USER"
  echo "added to kvm group, log out and back in before continuing"
  exit 1
fi

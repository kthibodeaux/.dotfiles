# vi: set ft=sh :

# colima drives lima (limactl) rather than bundling it - not shipped
# together, has to be installed separately.
if command -v limactl > /dev/null 2>&1; then
  echo "skipping install lima: already installed"
else
  lima_version=$(curl -fsSL https://api.github.com/repos/lima-vm/lima/releases/latest | grep -o '"tag_name": *"[^"]*"' | sed 's/.*"v\([^"]*\)"/\1/')
  mkdir -p ~/.local
  curl -fsSL "https://github.com/lima-vm/lima/releases/download/v${lima_version}/lima-${lima_version}-Linux-x86_64.tar.gz" | tar -xz -C ~/.local
  curl -fsSL "https://github.com/lima-vm/lima/releases/download/v${lima_version}/lima-additional-guestagents-${lima_version}-Linux-x86_64.tar.gz" | tar -xz -C ~/.local
fi

if command -v colima > /dev/null 2>&1; then
  echo "skipping install colima: already installed"
else
  mkdir -p ~/.local/bin
  curl -fsSL https://github.com/abiosoft/colima/releases/latest/download/colima-Linux-x86_64 -o ~/.local/bin/colima
  chmod +x ~/.local/bin/colima
fi

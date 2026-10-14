# vi: set ft=sh :

if distrobox enter dev -- command -v bob > /dev/null 2>&1; then
  echo "skipping install bob: already installed"
else
  distrobox enter dev -- bash -s <<'EOF'
set -e
url=$(curl -fsSL https://api.github.com/repos/MordechaiHadad/bob/releases/latest \
  | grep -o '"browser_download_url": *"[^"]*bob-linux-x86_64\.zip"' \
  | sed 's/.*"\(https[^"]*\)"/\1/')

mkdir -p ~/.local/bin
rm -rf /tmp/bob-extract
curl -fsSL "$url" -o /tmp/bob.zip
unzip -o /tmp/bob.zip -d /tmp/bob-extract
find /tmp/bob-extract -type f -name bob -exec mv {} ~/.local/bin/bob \;
chmod +x ~/.local/bin/bob
rm -rf /tmp/bob.zip /tmp/bob-extract
EOF
fi

distrobox enter dev -- bob use stable

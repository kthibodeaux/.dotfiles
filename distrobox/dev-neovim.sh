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

if distrobox enter dev -- command -v gopls > /dev/null 2>&1; then
  echo "skipping install gopls: already installed"
else
  distrobox enter dev -- go install golang.org/x/tools/gopls@latest
fi

if distrobox enter dev -- command -v golangci-lint-langserver > /dev/null 2>&1; then
  echo "skipping install golangci-lint-langserver: already installed"
else
  distrobox enter dev -- go install github.com/nametake/golangci-lint-langserver@latest
fi

if distrobox enter dev -- command -v buf > /dev/null 2>&1; then
  echo "skipping install buf: already installed"
else
  distrobox enter dev -- go install github.com/bufbuild/buf/cmd/buf@latest
fi

if distrobox enter dev -- command -v typescript-language-server > /dev/null 2>&1; then
  echo "skipping install typescript-language-server: already installed"
else
  distrobox enter dev -- sudo npm install -g typescript-language-server typescript
fi

if distrobox enter dev -- command -v vue-language-server > /dev/null 2>&1; then
  echo "skipping install vue-language-server: already installed"
else
  distrobox enter dev -- sudo npm install -g @vue/language-server
fi

if distrobox enter dev -- command -v sql-formatter > /dev/null 2>&1; then
  echo "skipping install sql-formatter: already installed"
else
  distrobox enter dev -- sudo npm install -g sql-formatter
fi

if distrobox enter dev -- command -v lua-language-server > /dev/null 2>&1; then
  echo "skipping install lua-language-server: already installed"
else
  distrobox enter dev -- bash -s <<'EOF'
set -e
url=$(curl -fsSL https://api.github.com/repos/LuaLS/lua-language-server/releases/latest \
  | grep -o '"browser_download_url": *"[^"]*linux-x64\.tar\.gz"' \
  | sed 's/.*"\(https[^"]*\)"/\1/')

mkdir -p ~/.local/share/lua-language-server
curl -fsSL "$url" | tar -xz -C ~/.local/share/lua-language-server

mkdir -p ~/.local/bin
cat > ~/.local/bin/lua-language-server <<'WRAPPER'
#!/bin/sh
exec "$HOME/.local/share/lua-language-server/bin/lua-language-server" "$@"
WRAPPER
chmod +x ~/.local/bin/lua-language-server
EOF
fi

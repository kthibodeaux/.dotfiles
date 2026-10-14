# vi: set ft=sh :

# usage: dev-lsp.sh [--update]
#   --update  reinstall the language servers even if already present,
#             pulling the latest versions

update=0
for arg in "$@"; do
  case "$arg" in
    -u|--update) update=1 ;;
    *) echo "unknown argument: $arg" >&2; exit 1 ;;
  esac
done

have() {
  [ "$update" -eq 0 ] && distrobox enter dev -- bash -c "PATH=\$HOME/go/bin:\$HOME/.local/bin:\$PATH command -v $1" < /dev/null > /dev/null 2>&1
}

if have gopls; then
  echo "skipping install gopls: already installed"
else
  echo "installing gopls..."
  distrobox enter dev -- go install golang.org/x/tools/gopls@latest
fi

if have golangci-lint-langserver; then
  echo "skipping install golangci-lint-langserver: already installed"
else
  echo "installing golangci-lint-langserver..."
  distrobox enter dev -- go install github.com/nametake/golangci-lint-langserver@latest
fi

if have buf; then
  echo "skipping install buf: already installed"
else
  echo "installing buf..."
  distrobox enter dev -- go install github.com/bufbuild/buf/cmd/buf@latest
fi

if have typescript-language-server; then
  echo "skipping install typescript-language-server: already installed"
else
  echo "installing typescript-language-server..."
  distrobox enter dev -- sudo npm install -g typescript-language-server
fi

# typescript-language-server needs a tsserver-based typescript, which 7.x (native) dropped
if [ "$update" -eq 0 ] && distrobox enter dev -- tsc --version < /dev/null 2>/dev/null | grep -q '^Version 5\.'; then
  echo "skipping install typescript@5: already installed"
else
  echo "installing typescript@5..."
  distrobox enter dev -- sudo npm install -g typescript@5
fi

if have vue-language-server; then
  echo "skipping install vue-language-server: already installed"
else
  echo "installing vue-language-server..."
  distrobox enter dev -- sudo npm install -g @vue/language-server
fi

if have sql-formatter; then
  echo "skipping install sql-formatter: already installed"
else
  echo "installing sql-formatter..."
  distrobox enter dev -- sudo npm install -g sql-formatter
fi

if have lua-language-server; then
  echo "skipping install lua-language-server: already installed"
else
  echo "installing lua-language-server..."
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

if have arduino-language-server; then
  echo "skipping install arduino-language-server: already installed"
else
  echo "installing arduino-language-server..."
  distrobox enter dev -- go install github.com/arduino/arduino-language-server@latest
fi

if have docker-langserver; then
  echo "skipping install dockerfile-language-server: already installed"
else
  echo "installing docker-langserver..."
  distrobox enter dev -- sudo npm install -g dockerfile-language-server-nodejs
fi

if have docker-compose-langserver; then
  echo "skipping install docker-compose-language-service: already installed"
else
  echo "installing docker-compose-langserver..."
  distrobox enter dev -- sudo npm install -g @microsoft/compose-language-service
fi

if have vscode-eslint-language-server && have vscode-json-language-server; then
  echo "skipping install vscode-langservers-extracted: already installed"
else
  echo "installing vscode-eslint-language-server and vscode-json-language-server..."
  distrobox enter dev -- sudo npm install -g vscode-langservers-extracted
fi

if have yaml-language-server; then
  echo "skipping install yaml-language-server: already installed"
else
  echo "installing yaml-language-server..."
  distrobox enter dev -- sudo npm install -g yaml-language-server
fi

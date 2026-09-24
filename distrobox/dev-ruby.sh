# vi: set ft=sh :

RUBY_VERSION="4.0.4"

if distrobox enter dev -- command -v ruby-install > /dev/null 2>&1; then
  echo "skipping install ruby-install: already installed"
else
  distrobox enter dev -- bash -s <<'EOF'
set -e
tag=$(curl -fsSL https://api.github.com/repos/postmodern/ruby-install/releases/latest | grep -o '"tag_name": *"[^"]*"' | sed 's/.*"\(v[^"]*\)"/\1/')
curl -fsSL "https://github.com/postmodern/ruby-install/archive/${tag}.tar.gz" | tar -xz -C /tmp
cd "/tmp/ruby-install-${tag#v}"
sudo make install
EOF
fi

if distrobox enter dev -- bash -c '[ -f /usr/share/chruby/chruby.sh ]'; then
  echo "skipping install chruby: already installed"
else
  distrobox enter dev -- bash -s <<'EOF'
set -e
tag=$(curl -fsSL https://api.github.com/repos/postmodern/chruby/releases/latest | grep -o '"tag_name": *"[^"]*"' | sed 's/.*"\(v[^"]*\)"/\1/')
curl -fsSL "https://github.com/postmodern/chruby/releases/download/${tag}/chruby-${tag#v}.tar.gz" | tar -xz -C /tmp
cd "/tmp/chruby-${tag#v}"
sudo make install PREFIX=/usr
EOF
fi

if distrobox enter dev -- bash -c "[ -d ~/.rubies/ruby-$RUBY_VERSION ]"; then
  echo "skipping install ruby $RUBY_VERSION: already installed"
else
  distrobox enter dev -- bash -s <<EOF
set -e
source /usr/share/chruby/chruby.sh
ruby-install ruby-$RUBY_VERSION
chruby $RUBY_VERSION
gem install bundler neovim rubocop rubocop-rspec ruby-lsp ruby-lsp-rails
EOF
fi

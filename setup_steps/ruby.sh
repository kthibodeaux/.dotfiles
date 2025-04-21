install_ruby() {
  if [ -d ~/.rubies/ruby-$1 ]; then
    echo "skipping install ruby $1: already installed"
  else
    ruby-install ruby-$1
    chruby $1
    gem install bundler
    gem install neovim
    gem install rubocop
    gem install rubocop-rspec
    gem install ruby-lsp
    gem install ruby-lsp-rails
  fi
  echo ""
}

install_ruby "3.4.2"

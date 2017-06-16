install_ruby() {
  if rvm use $1 > /dev/null; then
    echo "skipping install ruby $1: already installed"
  else
    rvm install $1
    rvm use $1
    gem install bundler
    gem install neovim
    gem install reek
    gem install rubocop
  fi
  echo ""
}

set_default_ruby() {
  rvm --default use $1
}

install_rvm() {
  if [ -d ~/.rvm ]; then
    echo "skipping rvm: already installed"
  else
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable
  fi
  echo ""
}

source_rvm() {
  echo "sourcing rvm script"
  source "$HOME/.rvm/scripts/rvm"
}

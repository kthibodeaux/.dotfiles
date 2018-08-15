if [ -d ~/opt/dasht ]; then
  echo "skipping install dasht: already installed"
else
  git clone git@github.com:sunaku/dasht.git ~/opt/dasht
  export PATH="$HOME/opt/dasht/bin:$PATH"
  export MANPATH="$HOME/opt/dasht/man:$MANPATH"
  dasht-docsets-install -f bash
  dasht-docsets-install -f ruby_2
  dasht-docsets-install -f ruby_on_rails_5
fi

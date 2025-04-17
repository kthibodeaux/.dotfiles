export BROWSER=/usr/bin/firefox
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less
export LC_CTYPE=en_US.UTF-8

typeset -U path
path=(~/.dotfiles/bin ~/opt/bin ~/go/bin $path)

[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local

if [ -d "/home/linuxbrew" ]; then
  source /home/linuxbrew/.linuxbrew/opt/chruby/share/chruby/chruby.sh
else
  source /usr/share/chruby/chruby.sh
fi

chruby ruby-3.4.2

source ~/.zsh/functions/chruby_auto.sh

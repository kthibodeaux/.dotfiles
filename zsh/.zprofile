export BROWSER=/usr/bin/firefox
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less

typeset -U path
path=(~/.dotfiles/bin ~/opt/bin $path)

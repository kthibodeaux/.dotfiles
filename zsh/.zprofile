export BROWSER=/usr/bin/firefox
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less
export LC_CTYPE=en_US.UTF-8

typeset -U path
path=(~/.dotfiles/bin ~/opt/bin $path)

[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local

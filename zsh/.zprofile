export BROWSER=/usr/bin/firefox
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less
export LC_CTYPE=en_US.UTF-8

typeset -U path
path=(~/.dotfiles/bin ~/opt/bin ~/go/bin /opt/homebrew/bin /opt/homebrew/sbin $path)

[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local

if [[ $(uname) == "Darwin" ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
  export HOMEBREW_REPOSITORY="/opt/homebrew"
  [ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}"
  export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
fi

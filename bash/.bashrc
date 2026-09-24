# vi: set ft=sh :

# only do anything in interactive shells
case $- in
  *i*) ;;
  *) return ;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=20000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize

export PATH="$HOME/.local/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"

PS1='[\u@\h \W]\$ '

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

if [[ ! -f /run/.containerenv ]] && command -v distrobox > /dev/null 2>&1; then
  if distrobox list --no-color 2>/dev/null | awk -F'|' '{gsub(/^ +| +$/,"",$2); print $2}' | grep -qx "dev"; then
    echo "1) host"
    echo "2) dev"
    read -r -p "shell? [2] " reply
    case $reply in
      1) ;;
      2 | "") exec distrobox enter dev ;;
    esac
  fi
fi

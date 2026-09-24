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

PS1='[\u@\h \W]\$ '

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

# hop into the dev distrobox if it's available, but not when this .bashrc is
# itself being read from inside a container (it's bind-mounted from $HOME,
# so distrobox sees it too) - that would recurse forever.
if [[ ! -f /run/.containerenv ]] && command -v distrobox > /dev/null 2>&1; then
  if distrobox list --no-color 2>/dev/null | awk -F'|' '{gsub(/^ +| +$/,"",$2); print $2}' | grep -qx "dev"; then
    exec distrobox enter dev
  fi
fi

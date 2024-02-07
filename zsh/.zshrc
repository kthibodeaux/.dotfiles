unsetopt nomatch
setopt extendedglob

# completion
fpath=(~/.zsh/completion ~/.zsh/filthy $fpath)
autoload -U compinit
compinit

# completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''

# load custom functions
for function in ~/.zsh/functions/*; do
  source $function
done

if type "dircolors" > /dev/null; then
  eval `dircolors ~/.zsh/dircolors.ansi-dark`
fi

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt share_history
setopt inc_append_history
setopt extended_history

# vi mode
bindkey -v
bindkey ii vi-cmd-mode
bindkey "^R" history-incremental-search-backward

# provide zmv command for easy bulk renaming
# example for changing extension of all matching files in a heirarchy:
# zmv '(**/)(*).css.scss' '$1/$2.scss'
autoload -U zmv

# prompt
autoload -U promptinit && promptinit
prompt filthy

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

source /usr/share/chruby/chruby.sh
source ~/.zsh/functions/chruby_auto.sh

chruby ruby-3.1.1

opentmux

if [ $(upterm session list | wc -l) != "1" ]; then
  upterm session current | grep 'SSH Session' | tr -s ' ' | cut -d' ' -f3,4 | xclip -selection clipboard
  echo "Copied pair SSH address to clipboard"
fi

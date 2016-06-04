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

# use colors
source ~/.zsh/base16-ocean.dark.sh

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# makes color constants available
autoload -U colors
colors

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

autoload -z edit-command-line
zle -N edit-command-line

# bind useful keys
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^v" edit-command-line

# prompt
autoload -U promptinit && promptinit
prompt filthy

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local ]]

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

opentmux
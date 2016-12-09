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
setopt share_history
setopt inc_append_history
setopt extended_history

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

if [ "$USE_COLEMAK" == "1" ]; then
  bindkey ii vi-cmd-mode
  bindkey -M vicmd j vi-backward-char
  bindkey -M vicmd h up-line-or-history
  bindkey -M vicmd k down-line-or-history
else
  bindkey jj vi-cmd-mode
fi

autoload -z edit-command-line
zle -N edit-comnand-line

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

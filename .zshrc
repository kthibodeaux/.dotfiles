unsetopt nomatch
setopt extendedglob

if [[ -z $TMUX ]]; then
  export TERM='xterm-256color'
else
  export TERM='screen-256color'
fi

# completion
fpath=(~/.zsh/completion $fpath)
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

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE="$HOME/.history/$(date -u +%Y%m)"
touch $HISTFILE
HISTSIZE=10000
SAVEHIST=10000

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
source ~/.zsh/filthy.zsh

# fzf to use ag
export FZF_DEFAULT_COMMAND='ag -g "" --hidden --ignore .git'
export FZF_COMPLETION_TRIGGER=',,'

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local ]]

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

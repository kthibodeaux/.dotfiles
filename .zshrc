unsetopt nomatch

export ZSH_THEME="avit"
export TERM="xterm-256color"

# completion
fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit

# case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# load custom functions
for function in ~/.zsh/functions/*; do
  source $function
done

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# bind useful keys
bindkey "^R" history-incremental-search-backward

source ~/.zsh/theme.zsh
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local ]]

quote

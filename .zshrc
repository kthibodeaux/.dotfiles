unsetopt nomatch

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export ZSH_THEME="avit"
export TERM="xterm-256color"

plugins=(brew gem git git-extras jsontools wd rand-quote vagrant)

bindkey "^R" history-incremental-search-backward

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local ]]
[[ -f ~/.zsh.aliases ]] && source ~/.zsh.aliases
[[ -f ~/.zsh.functions ]] && source ~/.zsh.functions

quote

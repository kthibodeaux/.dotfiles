unsetopt nomatch

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export ZSH_THEME="avit"
export TERM="xterm-256color"

[[ -f ~/.zsh.aliases ]] && source ~/.zsh.aliases
[[ -f ~/.zsh.functions ]] && source ~/.zsh.functions

plugins=(brew bundler gem git git-extras jsontools rvm wd rand-quote vagrant
         gitignore)

bindkey "^R" history-incremental-search-backward

source $HOME/.zshrc.local

quote

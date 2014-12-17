# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="avit"
export TERM="xterm-256color"

alias ls="ls -Gp"
alias d_ds="find . -name .DS_Store -print0 | xargs -0 git rm --ignore-unmatch"
alias ruby-server="ruby -r webrick -e \"s = WEBrick::HTTPServer.new(:Port => 9090, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start\""
alias lines="find . -name '*.*' | xargs wc -l"

alias v="fg || vim"
alias vmi="vim"
alias bim="vim"

alias va="vagrant"
alias t="tmux"
alias gti="git"

alias p="padrino"
alias r="rails"
alias ber="bundle exec rails"
alias rpca="RAILS_ENV=production bundle exec rake assets:precompile"

alias s="rspec"
alias bes="bundle exec rspec"
alias c="cucumber"
alias bec="bundle exec cucumber"

alias zrc="vim ~/.dotfiles/.zshrc"
alias vrc="vim ~/.dotfiles/.vimrc"

alias chat="profanity -d"

timed_command () { perl -e 'alarm shift; exec @ARGV' "$@"; }
fuck() { ps -e | grep $1 | ruby -e "ARGF.read.to_s.split(/\\n/).each { |l| puts l.split(' ').first }" | xargs -L 1 kill -9 }
187() { if [ "$#" -eq 1 ]; then rvm use 1.8.7-p374@$1; else rvm use 1.8.7-p374; fi }
210() { if [ "$#" -eq 1 ]; then rvm use 2.1.0@$1; else rvm use 2.1.0; fi }
212() { if [ "$#" -eq 1 ]; then rvm use 2.1.2@$1; else rvm use 2.1.2; fi }

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(brew bundler gem git git-extras jsontools rvm sudo wd)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.local

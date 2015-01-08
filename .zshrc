unsetopt nomatch

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="avit"
export TERM="xterm-256color"

alias ls="ls -Gp"
alias d_ds="find . -name .DS_Store -print0 | xargs -0 git rm --ignore-unmatch"
alias ruby-server="ruby -r webrick -e \"s = WEBrick::HTTPServer.new(:Port => 9090, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start\""
alias lines="find . -name '*.*' | xargs wc -l"

alias v="vim"
alias vmi="vim"
alias bim="vim"
alias vu="vim +PluginInstall +qall"

alias :q="exit"

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

alias rzsh="source ~/.zshrc && source ~/.zshrc.local"

timed_command () { perl -e 'alarm shift; exec @ARGV' "$@"; }
fuck() { ps -e | grep $1 | ruby -e "ARGF.read.to_s.split(/\\n/).each { |l| puts l.split(' ').first }" | xargs -L 1 kill -9 }
187() { if [ "$#" -eq 1 ]; then rvm use 1.8.7-p374@$1; else rvm use 1.8.7-p374; fi }
210() { if [ "$#" -eq 1 ]; then rvm use 2.1.0@$1; else rvm use 2.1.0; fi }
212() { if [ "$#" -eq 1 ]; then rvm use 2.1.2@$1; else rvm use 2.1.2; fi }
215() { if [ "$#" -eq 1 ]; then rvm use 2.1.5@$1; else rvm use 2.1.5; fi }

# from aarobc/dotfiles #
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *)           echo "don't know how to extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

plugins=(brew bundler gem git git-extras jsontools rvm sudo wd)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.local

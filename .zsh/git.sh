# vi: set ft=sh :

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

cm() {
  if [[ $# > 0 ]]; then
    git commit -m $@
  else
    git commit -v
  fi
}

git-nuke() {
  if [[ $# == 1 ]]; then
    confirm && git branch -D $1 && git push origin :$1
  else
    echo "No single branch name given"
    return 1;
  fi
}

feature() { git checkout -b kdt/$@ }

# Complete g like git
compdef g=git

alias co="git checkout"
alias cl="git clone"

alias gp="git push"
alias gb="git branch"
alias gd="git diff"
alias gds="git diff --stat"
alias gcp="git cherry-pick"

alias churn="git log --all --name-only --format='format:' | grep -v '^$' | sort | uniq -c | sort -n | tail"

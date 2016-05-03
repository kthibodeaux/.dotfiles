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

feature() {
  git checkout -b kdt/$@
}

# Complete g like git
compdef g=git

alias gp="git push"
alias gb="git branch"
alias gco="git checkout"
alias gnew="git checkout -b"
alias gcm="git commit -m"
alias gd="git diff"
alias gds="git diff --stat"
alias gcp="git cherry-pick"

alias churn="git log --all --name-only --format='format:' | grep -v '^$' | sort | uniq -c | sort -n | tail"

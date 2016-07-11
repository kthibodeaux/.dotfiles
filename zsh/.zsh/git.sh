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

# Complete g like git
compdef g=git

alias cfu="git commit --fixup"
alias co="git checkout"
alias cl="git clone"

alias d="git diff"
alias ds="git diff --staged"

alias gp="git push"
alias gb="git branch"
alias gcp="git cherry-pick"
alias gun="git reset HEAD"

alias releases="git log | grep -v 'tag: ' | grep -i 'feature\|hotfix'"

alias churn="git log --all --name-only --format='format:' | grep -v '^$' | sort | uniq -c | sort -n | tail"

alias gf="git flow"
alias gff="git flow feature"
alias gfr="git flow release"
alias gfh="git flow hotfix"
alias gfs="git flow support"

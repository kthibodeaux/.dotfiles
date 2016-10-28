# vi: set ft=sh :
# vim:foldmethod=indent:foldlevel=0

g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status --short --branch
  fi
}

a() {
  if [ "$TMUX" = "" ]; then
    git add $(git status -s | awk '{ print $2 }' | fzf -m)
  else
    git add $(git status -s | awk '{ print $2 }' | fzf-tmux -m)
  fi
}

ap() {
  if [ "$TMUX" = "" ]; then
    git add -p $(git status -s | awk '{ print $2 }' | fzf -m)
  else
    git add -p $(git status -s | awk '{ print $2 }' | fzf-tmux -m)
  fi
}

cm() {
  if [[ $# > 0 ]]; then
    git commit -m $@
  else
    git commit -v
  fi
}

co() {
  if [[ $# > 0 ]]; then
    git co $@
  else
    if [ "$TMUX" = "" ]; then
      git co $(git status -s | awk '{ print $2 }' | fzf -m)
    else
      git co $(git status -s | awk '{ print $2 }' | fzf-tmux -m)
    fi
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

dev() {
  git checkout develop && git up
}

hotfix() {
  branch=$(echo "$@" | tr ' ' '-')
  git checkout master && git up && git checkout -b "hotfix/$branch"
}

feature() {
  branch=$(echo "$@" | tr ' ' '-')
  dev && git checkout -b "feature/$branch"
}

support() {
  branch=$(echo "$@" | tr ' ' '-')
  dev && git checkout -b "support/$branch"
}

ir() {
  git rev-parse --verify develop
  if [[ $? == 0 ]]; then
    git rebase -i develop
  else
    git rebase -i master
  fi
}

br() {
  if [[ $# == 0 ]]; then
    branches=$(git branch)
    if [ "$TMUX" = "" ]; then
      target=$(echo $branches | fzf)
    else
      target=$(echo $branches | fzf-tmux)
    fi

    if [[ $target != '' ]]; then
      git checkout $(echo $target)
    fi
  fi
}

cfu() {
  if [ "$TMUX" = "" ]; then
    target=$(git log --pretty=oneline develop..) | fzf | awk '{ print $1 }')
  else
    target=$(git log --pretty=oneline develop..) | fzf-tmux | awk '{ print $1 }')
  fi

  if [[ $target != '' ]]; then
    git commit --fixup $(echo $target)
  fi
}

# Complete g like git
compdef g=git

alias cl="git clone"

alias d="git diff"
alias ds="git diff --staged"

alias gp="git push"
alias gb="git branch"
alias gcp="git cherry-pick"
alias gun="git reset HEAD"

alias releases="git log | grep -v 'tag: ' | grep -i 'feature\|hotfix'"

alias churn="git log --all --name-only --format='format:' | grep -v '^$' | sort | uniq -c | sort -n | tail"

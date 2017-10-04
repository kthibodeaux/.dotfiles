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
    git add $(git status -s | awk '{ print $2 }' | fzf -m --preview 'git diff --color=always {}')
  else
    git add $(git status -s | awk '{ print $2 }' | fzf-tmux -m --preview 'git diff --color=always {}')
  fi
}

ap() {
  if [ "$TMUX" = "" ]; then
    git add -p $(git status -s | awk '{ print $2 }' | fzf -m --preview 'git diff --color=always {}')
  else
    git add -p $(git status -s | awk '{ print $2 }' | fzf-tmux -m --preview 'git diff --color=always {}')
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
      git co $(git status -s | awk '{ print $2 }' | fzf -m --preview 'git diff --color=always {}')
    else
      git co $(git status -s | awk '{ print $2 }' | fzf-tmux -m --preview 'git diff --color=always {}')
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

gbD() {
  if [[ $# == 0 ]]; then
    set_base_branch

    branches=$(git branch)
    if [ "$TMUX" = "" ]; then
      targets=$(echo $branches | awk '{$1=$1};1' | fzf --preview 'git short-log $BASE_BRANCH..{} | head')
    else
      targets=$(echo $branches | awk '{$1=$1};1' | fzf-tmux --preview 'git short-log $BASE_BRANCH..{} | head')
    fi

    echo $targets
    confirm && git branch -D $(echo $targets)
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

set_base_branch() {
  if git rev-parse -q --verify develop; then
    BASE_BRANCH="develop"
  else
    BASE_BRANCH="master"
  fi
}

ir() {
  if [[ $# > 0 ]]; then
    git rebase -i $@
  else
    set_base_branch
    git rebase -i $BASE_BRANCH
  fi
}

br() {
  if [[ $# == 0 ]]; then
    set_base_branch

    branches=$(git branch)
    if [ "$TMUX" = "" ]; then
      target=$(echo $branches | awk '{$1=$1};1' | fzf --preview 'git short-log $BASE_BRANCH..{} | head')
    else
      target=$(echo $branches | awk '{$1=$1};1' | fzf-tmux --preview 'git short-log $BASE_BRANCH..{} | head')
    fi

    if [[ $target != '' ]]; then
      git checkout $(echo $target)
    fi
  fi
}

cfu() {
  set_base_branch
  if [ "$TMUX" = "" ]; then
    target=$(git log --pretty=oneline $BASE_BRANCH.. | fzf --preview "echo {} | cut -f 1 -d' ' | xargs -I SHA git show --color=always --pretty=fuller --stat SHA" | awk '{ print $1 }')
  else
    target=$(git log --pretty=oneline $BASE_BRANCH.. | fzf-tmux --preview "echo {} | cut -f 1 -d' ' | xargs -I SHA git show --color=always --pretty=fuller --stat SHA" | awk '{ print $1 }')
  fi

  if [[ $target != '' ]]; then
    git commit --fixup $(echo $target)
  fi
}

changes() {
  if [[ $# > 0 ]]; then
    tig "$@".."$(git rev-parse --abbrev-ref HEAD)"
  else
    set_base_branch
    tig $BASE_BRANCH.."$(git rev-parse --abbrev-ref HEAD)"
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
alias oops="git reset HEAD~1"

alias releases="git log | grep -v 'tag: ' | grep -i 'feature\|hotfix'"

alias churn="git log --all --name-only --format='format:' | grep -v '^$' | sort | uniq -c | sort -n | tail"

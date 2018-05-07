# vim:foldmethod=indent:foldlevel=0

base_branch() {
  if git rev-parse -q --verify develop > /dev/null; then
    echo "develop"
  else
    echo "master"
  fi
}

g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status --short --branch
  fi
}

a() {
  git add $(git status -s | awk '{ print $2 }' | $(fzf_prog) -m --preview 'git diff --color=always {}')
}

ap() {
  git add -p $(git status -s | awk '{ print $2 }' | $(fzf_prog) -m --preview 'git diff --color=always {}')
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
    git checkout $@
  else
    git checkout $(git status -s | awk '{ print $2 }' | $(fzf_prog) -m --preview 'git diff --color=always {}')
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
    base_branch=$(base_branch)
    branches=$(git branch)
    targets=$(echo $branches | awk '{$1=$1};1' | $(fzf_prog) -m --preview 'git short-log $base_branch..{} | head')

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


ir() {
  if [[ $# > 0 ]]; then
    git rebase -i $@
  else
    git rebase -i $(base_branch)
  fi
}

br() {
  if [[ $# == 0 ]]; then
    # have to assign as variable because the preview command will not see the function
    base_branch=$(base_branch)
    branches=$(git branch)
    target=$(echo $branches | awk '{$1=$1};1' | $(fzf_prog) --preview 'git short-log $base_branch..{} | head')

    if [[ $target != '' ]]; then
      git checkout $(echo $target)
    fi
  fi
}

cfu() {
  target=$(git log --pretty=oneline $(base_branch).. | $(fzf_prog) --preview "echo {} | cut -f 1 -d' ' | xargs -I SHA git show --color=always --pretty=fuller --stat SHA" | awk '{ print $1 }')

  if [[ $target != '' ]]; then
    git commit --fixup $(echo $target)
  fi
}

changes() {
  if [[ $# > 0 ]]; then
    tig "$@".."$(git rev-parse --abbrev-ref HEAD)"
  else
    tig $(base_branch).."$(git rev-parse --abbrev-ref HEAD)"
  fi
}

# Complete g like git
compdef g=git

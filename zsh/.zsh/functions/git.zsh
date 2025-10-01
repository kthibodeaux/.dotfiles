base_branch() {
  if git rev-parse -q --verify develop > /dev/null; then
    echo "develop"
  elif git rev-parse -q --verify main > /dev/null; then
    echo "main"
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
  git add $(git status -s | awk '{ print $2 }' | fzf -m --preview 'git diff --color=always {}')
}

ap() {
  git add -p $(git status -s | awk '{ print $2 }' | fzf -m --preview 'git diff --color=always {}')
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
    git checkout $(git status -s | awk '{ print $2 }' | fzf -m --preview 'git diff --color=always {}')
  fi
}

gp() {
  base_branch=$(base_branch)
  branch=$(git rev-parse --abbrev-ref HEAD)

  if [[ "$branch" == "$base_branch" ]]; then
    echo "Warning: You are pushing to $base_branch!"
    read -r "reply?Are you sure you want to continue? [y/N] "
    if [[ ! "$reply" =~ ^[Yy]$ ]]; then
      echo "Push aborted."
      return 1
    fi
  fi
  git push "$@"
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
    targets=$(echo $branches | awk '{$1=$1};1' | fzf -m --preview 'git short-log $base_branch..{} | head')

    echo $targets
    confirm && git branch -D $(echo $targets)
  fi
}

gd() {
  base_branch=$(base_branch)

  if [[ $base_branch == "master" ]]; then
    merge_branch=$(git branch --show-current)
    git fetch && git rebase origin/master && git checkout master && git merge @{-1} --no-ff && git push

    git branch -D $merge_branch && git push origin :$merge_branch
  fi
}

gdm() {
  if [[ $base_branch == "main" ]]; then
    git branch --merged origin/main | grep -v main | xargs git branch -d
  elif [[ $base_branch == "develop" ]]; then
    git branch --merged origin/develop | grep -v develop | xargs git branch -d
  else
    git branch --merged origin/master | grep -v master | xargs git branch -d
  fi
}

dev() {
  base_branch=$(base_branch)

  git checkout $base_branch && git-up
}

br() {
  if [[ $1 == '-a' ]]; then
    branches=$(git branch -a)
  else
    branches=$(git branch)
  fi

  # have to assign as variable because the preview command will not see the function
  base_branch=$(base_branch)
  target=$(echo $branches | awk '{$1=$1};1' | fzf --preview 'git short-log $base_branch..{} | head')

  if [[ $target != '' ]]; then
    git checkout $(echo $target)
  fi
}

cfu() {
  target=$(git log --pretty=oneline $(base_branch).. | fzf --preview "echo {} | cut -f 1 -d' ' | xargs -I SHA git show --color=always --pretty=fuller --stat SHA" | awk '{ print $1 }')

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

pa() {
  root_dir=$(pwd)
  ls -1 -d */ --indicator-style=none --color=never | xargs -I{} sh -c "echo {} && cd $root_dir/{} && git-up"
  cd $root_dir
}

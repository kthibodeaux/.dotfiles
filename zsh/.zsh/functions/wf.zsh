next_story() {
  wf --start-card --card $(wf --list-unstarted-cards | fzf-tmux | awk '{print $1;}') --include-related
}

rft() {
  if [[ $# > 0 ]]; then
    wf --mark-ready-for-testing --list $1
    wf --prepare-release-card --list $1
  else
    echo "argument required (release name)"
  fi
}

next_story() {
  wf --start-card --card $(wf --list-unstarted-cards | fzf-tmux | awk '{print $1;}') --include-related
}

deploy() {
  if [[ $# > 0 ]]; then
    wf --deploy --list $1
  else
    echo "argument required (release name)"
  fi
}

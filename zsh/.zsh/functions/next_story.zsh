function next_story() {
  wf --start-card --card $(wf --list-unstarted-cards | fzf-tmux | awk '{print $1;}')
}

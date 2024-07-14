finished() {
  ppwf --create-pr
}

next_story () {
  ppwf --work-issue --issue $(ppwf --list-issues | fzf-tmux | awk '{print $1;}')
}

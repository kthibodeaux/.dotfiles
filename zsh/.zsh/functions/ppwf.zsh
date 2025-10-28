draft() {
  ppwf --create-draft-pr
}

finished() {
  ppwf --create-pr
}

next_story () {
  issue=$(ppwf --list-issues | fzf | awk '{print $1;}')
  ppwf --work-issue --issue $issue
}

finished() {
  ppwf --create-pr
}

select_issue() {
  $(fzf_prog)
}

next_story () {
  issue=$(ppwf --list-issues | select_issue | awk '{print $1;}')
  ppwf --work-issue --issue $issue
}

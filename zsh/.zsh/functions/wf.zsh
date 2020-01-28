rft() {
  if [[ $# > 0 ]]; then
    wf --mark-ready-for-testing --list $1
    wf --prepare-release-card --list $1
  else
    echo "argument required (release name)"
  fi
}

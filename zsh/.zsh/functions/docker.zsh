db() {
  containers=$(docker ps -a --format "{{.ID}} {{.Names}} {{.Image}}" | grep unsafe_postgres)
  target=$(echo $containers | $(fzf_prog) | awk '{ print $1 }')
  echo $containers | awk '{ print $1 }' | xargs -I NAME docker stop NAME > /dev/null
  docker start $target > /dev/null
}

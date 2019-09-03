db() {
  containers=$(docker ps -a --format "{{.ID}} {{.Names}} {{.Image}}" | grep unsafe_postgres)
  target=$(echo $containers | $(fzf_prog) | awk '{ print $1 }')
  echo $containers | awk '{ print $1 }' | xargs -I NAME docker stop NAME > /dev/null
  docker start $target > /dev/null
}

docker_or_local() {
  local image=""
  local default_image="web"

  if [[ -f docker-compose.yml ]]; then
    if [[ -f .docker_or_local ]]; then
      local config=$(grep "$1=" .docker_or_local)
      local image=$(echo $config | cut -d= -f2)
    fi

    if [[ $image == "" ]]; then
      local image=$default_image
    fi
  fi

  if [[ $image == "" ]]; then
    eval {"SKIP_SIMPLECOV=true $@"}
  else
    eval {"docker-compose run --rm --no-deps -e SKIP_SIMPLECOV=true $image $@"}
  fi
}

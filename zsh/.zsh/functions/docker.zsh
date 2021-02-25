docker_or_local() {
  local image=""
  local default_image="web"

  if [[ -f docker-compose.yml ]]; then
    if [[ -f .docker_or_local ]]; then
      local command=$(echo $1 | cut -d' ' -f1)
      local config=$(grep "$command=" .docker_or_local)
      local image=$(echo $config | cut -d= -f2)
    fi

    if [[ $image == "" ]]; then
      local image=$default_image
    fi
  fi

  if [[ $image == "" ]]; then
    eval {"SKIP_SIMPLECOV=true $@"}
  else
    eval {"docker-compose run --rm --no-deps -e SKIP_SIMPLECOV=true $image /bin/bash -c \"$@\""}
  fi
}

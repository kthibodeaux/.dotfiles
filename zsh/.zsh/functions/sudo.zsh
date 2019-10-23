# if a user alias exists for the command, run it instead of the actual command
# https://askubuntu.com/a/830239

sudo() {
  if alias "$1" &> /dev/null ; then
    $(type "$1" | sed -E 's/^.*`(.*).$/\1/') "${@:2}"
  else
    command sudo "$@"
  fi
}

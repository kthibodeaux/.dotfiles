pair() {
  if [ "$TMUX" = "" ]; then
    upterm host --force-command 'tmux attach -t pair-programming' --github-user $1
  else
    upterm session current | grep 'SSH Session' | tr -s ' ' | cut -d' ' -f3,4 | xclip -selection clipboard
    echo "Copied address to clipboard"
  fi
}

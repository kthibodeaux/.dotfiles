fzf_prog() {
  if [ "$TMUX" =~ "tmux" ]; then
    echo "fzf --tmux 80%"
  else
    echo "fzf"
  fi
}

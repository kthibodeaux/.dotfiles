fzf_prog() {
  if [ "$TMUX" =~ "tmux" ]; then
    echo "fzf-tmux"
  else
    echo "fzf"
  fi
}

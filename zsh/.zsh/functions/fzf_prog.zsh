fzf_prog(){
  if [ "$TMUX" = "" ]; then
    echo "fzf"
  else
    echo "fzf-tmux"
  fi
}

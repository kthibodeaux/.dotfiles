choose_pairs() {
  names=($(cat ~/pairs.txt | $(fzf_prog) -m))
  printf "--github-user %s " "${names[@]}"
}

function opentmux() {
  if [ "$TMUX" = "" ]; then
    tmux ls
    echo ""
    echo "Enter a session number, p for new pair session, q to not launch tmux, n for a new session"
    read "response?[#/p/n/q] "
    case $response in
      [qQ])
        return 1
        ;;
      [pP])
        upterm host --force-command 'tmux attach -t pair-programming' $(choose_pairs) -- tmux new -t pair-programming
        ;;
      *)
        tmux attach -t $response || tmux new
        ;;
    esac
  fi
}

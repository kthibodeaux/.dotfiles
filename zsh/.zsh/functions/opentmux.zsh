function opentmux() {
  if [ "$TMUX" = "" ]; then
    tmux ls
    echo ""
    echo "Enter a session number, p for new pair session (tmate), q to not launch tmux, n for a new session"
    read "response?[#/p/n/q] "
    case $response in
      [qQ])
        return 1
        ;;
      [pP])
        tmate
        ;;
      *)
        tmux attach -t $response || tmux new
        ;;
    esac
  fi
}

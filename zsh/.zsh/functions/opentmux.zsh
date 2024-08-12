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
        tty-share -public -listen "localhost:8010"
        ;;
      *)
        tmux attach -t $response || tmux new
        ;;
    esac
  fi
}

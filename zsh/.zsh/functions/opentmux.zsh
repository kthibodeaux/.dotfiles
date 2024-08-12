function opentmux() {
  if [ "$TMUX" = "" ]; then
    tmux ls
    echo ""
    echo "Enter a session number, q to not launch tmux, n for a new session"
    read "response?[#/n/q] "
    case $response in
      [qQ])
        return 1
        ;;
      *)
        tmux attach -t $response || tmux new
        ;;
    esac
  fi
}

function opentmux() {
  if [ "$TMUX" = "" ]; then
    tmux ls
    echo ""
    echo "Enter a session number, press q to not launch tmux, or n for a new session"
    read "response?[#/N/q] "
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

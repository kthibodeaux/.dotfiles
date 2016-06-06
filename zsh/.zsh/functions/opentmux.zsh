function opentmux() {
  if [ "$TMUX" = "" ]; then
    if [[ $(tmux ls) != 0 ]]; then
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
    else
      # Initial opening of iTerm2 will not load colors if tmux opens too quickly
      # We sleep here to give colors time to load
      # Since this is only ever going to execute if there are no other tmux sessions open it should be at most a once a day sleep
      sleep 1; tmux new
    fi
  fi
}

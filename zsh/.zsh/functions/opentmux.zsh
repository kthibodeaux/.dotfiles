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
        vared -p "Enter a session number, n for a new session " -c session_name

        if [ "$session_name" = "n" ]; then
          upterm host --force-command 'tmux attach -t pair-programming' $(choose_pairs) -- tmux new -t pair-programming
        else
          upterm host --force-command "tmux attach -t $session_name" $(choose_pairs) -- tmux attach -t $session_name
        fi
        ;;
      *)
        tmux attach -t $response || tmux new
        ;;
    esac
  fi
}

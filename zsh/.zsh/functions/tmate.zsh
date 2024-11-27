pair() {
  tmate display -p '#{tmate_ssh}' | tr -d '\n' | xclip -selection clipboard
  echo "Copied upterm SSH address to clipboard"
}

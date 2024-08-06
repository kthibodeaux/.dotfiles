choose_pairs() {
  names=($(cat ~/pairs.txt | fzf -m))
  printf "--github-user %s " "${names[@]}"
}

pair() {
  upterm session current | grep 'SSH Session' | tr -s ' ' | cut -d' ' -f3,4 | xclip -selection clipboard
  echo "Copied upterm SSH address to clipboard"
}

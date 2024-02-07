choose_pairs() {
  names=($(cat ~/pairs.txt | $(fzf_prog) -m))
  printf "--github-user %s " "${names[@]}"
}

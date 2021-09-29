#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_DIR/utils.sh

match_lookup_table=$(fingers_tmp)
pane_output_temp=$(fingers_tmp)
flushed_input=0

# exporting them so they can be properly deleted at fingers.sh handle_exit trap
export match_lookup_table
export pane_output_temp

function lookup_match() {
  local input=$1

  input="$(echo "$input" | tr "A-Z" "a-z")"
  echo "$(cat $match_lookup_table | grep -i "^$input:" | sed "s/^$input://" | head -n 1)"
}

function get_stdin() {
  if [[ $(cat $pane_output_temp | wc -l) -gt 0 ]]; then
    cat $pane_output_temp
  else
    flushed_input="1"
    tee $pane_output_temp
  fi
}

function show_hints() {
  local fingers_pane_id=$1
  shift
  local compact_hints=$1
  shift
  local multi_mode=$1
  shift
  declare -a selected_hints=(${@})

  FINGERS_ALPHABET_DIR="$CURRENT_DIR/../alphabets/$FINGERS_KEYBOARD_LAYOUT/"

  clear_screen "$fingers_pane_id"
  get_stdin | FINGERS_SELECTED_HINTS="$(array_join ":" "${selected_hints[@]}")" FINGERS_COMPACT_HINTS="$compact_hints" FINGERS_ALPHABET_DIR="$FINGERS_ALPHABET_DIR" gawk -f $CURRENT_DIR/hinter.awk 3> $match_lookup_table
}

function show_hints_and_swap() {
  current_pane_id=$1
  fingers_pane_id=$2
  compact_state=$3
  show_hints "$fingers_pane_id" "$compact_state"
  tmux swap-pane -s "$current_pane_id" -t "$fingers_pane_id"
}

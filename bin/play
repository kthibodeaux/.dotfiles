#!/usr/bin/env bash

HOST="ascii-arcade.games"
OPTIONS=(
  "Farkle|2022"
  "Knucklebones|2023"
  "Cards Against Humanity|2024"
)

USE_GUM=false
if ! command -v gum &> /dev/null; then
    echo "gum is not installed. Using basic menu instead."
else
    USE_GUM=true
fi

PORT=""
GAME=""

if $USE_GUM; then
  GAMES=()
  for option in "${OPTIONS[@]}"; do
    GAMES+=("${option%%|*}")
  done

  SELECTED_GAME=$(gum choose --cursor.foreground "#00ff00" --cursor.background "#000000" "${GAMES[@]}")

  for option in "${OPTIONS[@]}"; do
    if [[ "$SELECTED_GAME" == "${option%%|*}" ]]; then
      GAME="${option%%|*}"
      PORT="${option#*|}"
      break
    fi
  done
else
  echo "Select a game to play:"
  select opt in "${OPTIONS[@]%%|*}" "Quit"; do
    if [[ $REPLY -gt 0 && $REPLY -le ${#OPTIONS[@]} ]]; then
      SELECTED_GAME="${OPTIONS[$((REPLY - 1))]}"
      GAME="${SELECTED_GAME%%|*}"
      PORT="${SELECTED_GAME#*|}"

      break
    elif [[ "$REPLY" -eq $((${#OPTIONS[@]} + 1)) ]]; then
      exit 0
    else
      echo "Invalid option."
    fi
  done
fi

echo "Connecting to $GAME..."
exec ssh $HOST -p $PORT

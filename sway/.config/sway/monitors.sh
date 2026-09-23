#!/bin/bash

CURRENT_HOSTNAME=$(hostname)

if [ "$CURRENT_HOSTNAME" = "linux-kthibodeaux" ]; then
  monitor=$(wlr-randr | grep -v "^ " | cut -d" " -f1 | grep -i hdmi)
  laptop=$(wlr-randr | grep -v "^ " | cut -d" " -f1 | grep -i dp)

  if [ -n "$monitor" ]; then
    wlr-randr --output "$monitor" --pos 0,0
    wlr-randr --output "$laptop" --off
  fi
fi

swaymsg output "*" bg $HOME/Pictures/background.png fill

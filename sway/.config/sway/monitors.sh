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

if [ "$CURRENT_HOSTNAME" = "all-mother" ]; then
  extra=$(wlr-randr | grep -v "^ " | grep -iE "cf15t|dp2hdmi" | cut -d" " -f1)

  if [ -n "$extra" ]; then
    # reduced blanking 1080p; standard timings flicker
    swaymsg -- output "$extra" modeline 138.50 1920 1968 2000 2080 1080 1083 1088 1111 +hsync -vsync
    swaymsg -- output "$extra" enable pos 3440 0
  else
    for output in $(wlr-randr | grep -v "^ " | cut -d" " -f1 | grep -v HDMI-A-1); do
      wlr-randr --output "$output" --off
    done
  fi
fi

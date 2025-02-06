#!/bin/bash

CURRENT_HOSTNAME=$(hostname)


if [ "$CURRENT_HOSTNAME" = "all-mother" ]; then
  horizontal=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep HDMI)
  vertical=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep DP)

  xrandr --output "$horizontal" --auto --primary
  xrandr --output "$vertical" --auto --right-of "$horizontal" --rotate left --pos 0x1080
fi

if [ "$CURRENT_HOSTNAME" = "linux-kthibodeaux" ]; then
  monitor=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep HDMI)
  laptop=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep DP)

  echo "$laptop"

  xrandr --output "$monitor" --auto --primary
  xrandr --output "$laptop" --off
fi

feh --bg-scale $HOME/Pictures/background.png

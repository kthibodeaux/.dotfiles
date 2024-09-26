#!/bin/bash

CURRENT_HOSTNAME=$(hostname)


if [ "$CURRENT_HOSTNAME" = "all-mother" ]; then
  horizontal=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep HDMI)
  vertical=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep DP)

  xrandr --output "$horizontal" --auto
  xrandr --output "$vertical" --auto --right-of "$horizontal" --rotate left --pos 0x1080
fi

feh --bg-scale /home/kthibodeaux/Pictures/background.png

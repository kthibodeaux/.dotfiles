#!/bin/bash
internal=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep eDP)
external=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep -v eDP)


if [ -z "$external" ]; then
  exit 0
else
  xrandr --output $internal --mode 1920x1080 --left-of $external
  xrandr --output $external --mode 2560x1440
fi

feh --bg-scale /home/kthibodeaux/Pictures/background.jpg

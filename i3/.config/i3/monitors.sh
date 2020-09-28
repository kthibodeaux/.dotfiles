#!/bin/bash

hasexternal=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep HDMI-1-1)

if [ -z "$hasexternal" ]; then
  # on single monitor desktop
  exit 0
else
  # on laptop with lid closed
  xrandr --output "eDP1" --off
  xrandr --output "HDMI-1-1" --auto
fi

feh --bg-scale /home/kthibodeaux/Pictures/background.jpg

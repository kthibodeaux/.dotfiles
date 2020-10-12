#!/bin/bash

internal=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep eDP)
external=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep HDMI)

if [ -n "$external" ]; then
  # on laptop with lid closed
  xrandr --output "$internal" --off
  xrandr --output "$external" --auto
fi

feh --bg-scale /home/kthibodeaux/Pictures/background.jpg

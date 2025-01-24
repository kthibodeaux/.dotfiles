#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

sleep .5

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    p=$(xrandr --query | grep "$m" | cut -d" " -f3)

    if [ "$p" == "primary" ]; then
      MONITOR=$m polybar --reload main &
    else
      MONITOR=$m polybar --reload side &
    fi
  done
fi

echo "Bars launched..."

#!/bin/bash

if pgrep -x gammastep > /dev/null; then
  pkill -x gammastep
else
  nohup gammastep >/dev/null 2>&1 &
fi

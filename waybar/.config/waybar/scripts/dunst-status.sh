#!/usr/bin/env bash

if [ "$(dunstctl is-paused)" = "true" ]; then
  echo '{"text":"","class":"paused","tooltip":"Notifications paused (click to unpause)"}'
else
  echo '{"text":"","class":"active","tooltip":"Notifications active (click to pause)"}'
fi

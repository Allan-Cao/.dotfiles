#!/usr/bin/env bash

polybar-msg cmd quit

# https://github.com/polybar/polybar/issues/763
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

echo "---" | tee -a /tmp/polybarDesktop.log /tmp/polybarSecond.log
polybar desktop 2>&1 | tee -a /tmp/polybarDesktop.log & disown
polybar secondmonitor 2>&1 | tee -a /tmp/polybarSecond.log & disown

echo "Bars launched..."

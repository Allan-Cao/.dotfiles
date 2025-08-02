#!/usr/bin/env bash

# Kill any running polybar instances
killall -q polybar
polybar-msg cmd quit 2>/dev/null || true

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Get connected monitors
if type "xrandr" > /dev/null; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload main &
    done
else
    polybar --reload main &
fi

echo "Polybar launched..."
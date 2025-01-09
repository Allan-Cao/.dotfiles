#!/usr/bin/env bash

# Kill any running polybar instances
killall -q polybar
polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Create logs directory if it doesn't exist
mkdir -p /tmp/polybar_logs

# Function to check if a monitor is connected
is_monitor_connected() {
    xrandr --query | grep "^$1 connected" >/dev/null
}

# Function to log polybar output
log_polybar() {
    local bar_name=$1
    local log_file="/tmp/polybar_logs/$bar_name.log"
    echo "---" | tee -a "$log_file"
    return $log_file
}

# Clear previous logs
rm -f /tmp/polybar_logs/*.log

# Check monitor setup and launch appropriate configuration
if is_monitor_connected "DP-2"; then
    # External monitor is connected
    # Turn off internal display
    xrandr --output eDP-1 --off --output DP-2 --auto --primary
    
    # Set monitor environment variable and launch polybar
    MONITOR="DP-2" polybar primary 2>&1 | tee -a /tmp/polybar_logs/primary.log & disown
    
    echo "Launched polybar on DP-2"
else
    # Only internal display
    xrandr --output eDP-1 --auto --primary --output DP-2 --off
    
    # Set monitor environment variable and launch polybar
    MONITOR="eDP-1" polybar primary 2>&1 | tee -a /tmp/polybar_logs/primary.log & disown
    
    echo "Launched polybar on eDP-1"
fi

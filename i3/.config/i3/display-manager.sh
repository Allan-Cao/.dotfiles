#!/bin/bash

laptop_docked() {
  xrandr | grep "DP-2 connected" >/dev/null
}

if laptop_docked; then
  xrandr --output eDP-1 --off --output DP-2 --auto --primary

  # Disable lid witch action when laptop_docked
#  sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
#  sudo systemctl restart systemd-logind
else
  xrandr --output eDP-1 --auto --primary --output DP-2 --off
fi

#!/usr/bin/env bash

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybarDesktop.log
polybar desktop 2>&1 | tee -a /tmp/polybarDesktop.log & disown

echo "Bars launched..."

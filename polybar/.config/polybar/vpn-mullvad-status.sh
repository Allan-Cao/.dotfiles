#!/bin/sh

STATUS=$(mullvad status 2>/dev/null)

case "$STATUS" in
    *"Connected"*)
        CONNECTED=true
        ;;
    *)
        CONNECTED=false
        ;;
esac

mullvad_toggle() {
    if $CONNECTED; then
        mullvad disconnect
    else
        mullvad connect
    fi
}

mullvad_status() {
    if $CONNECTED; then
        echo "$STATUS" | awk 'NR==2 {print $2}'
    else
        echo 'Disconnected'
    fi
}

case "$1" in
    --toggle)
        mullvad_toggle
    ;;
    *)
        mullvad_status
    ;;
esac

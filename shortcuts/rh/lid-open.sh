#!/bin/bash

LAST_DISPLAY="none"

function enable_display {
    local displayName="$1"

    if xrandr -q | grep "^$displayName connected" > /dev/null ; then
        local maxRes
        maxRes=$(xrandr -q | grep -A 1 "^$displayName connected" | sed -e '1d' | awk '{ print $1 }')
        echo "Max res: $maxRes"
        if [ "$LAST_DISPLAY" != "none" ] ; then
            echo "setting $displayName right of $LAST_DISPLAY"
            xrandr --output "$displayName" --mode "$maxRes" --right-of "$LAST_DISPLAY"
        else
            echo "setting $displayName as first monitor"
            xrandr --output "$displayName" --mode "$maxRes" 
        fi
        LAST_DISPLAY="$displayName"
    fi
}

xrandr --auto
enable_display "eDP-1"
enable_display "DP-1"
enable_display "DP-2"
enable_display "DP-3"

feh --bg-scale ~/.config/i3/background.jpg


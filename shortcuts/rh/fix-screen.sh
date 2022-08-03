#!/bin/bash

dp1Exists=$(xrandr | grep "^DP-1 connected" )
dp2Exists=$(xrandr | grep "^DP-2 connected" )
dp3Exists=$(xrandr | grep "^DP-3 connected" )
laptopMonitorExists=$(xrandr | grep "^eDP-1 connected" )

laptopLidState=$(grep "open" /proc/acpi/button/lid/LID*/state)


#dp3 is primary, if it exists then simply set it
if [ -n "$dp3Exists" ]
then
  xrandr --output DP-3 --mode 1920x1080 
fi

#dp1 is secondary, if it exists, set it relative to DP-3
if [ -n "$dp1Exists" ]
then
  if [ -n "$dp3Exists" ]
  then
    xrandr --output DP-1 --mode 1920x1080 --left-of DP-3
  else
    #no DP-3, so use this as primary
    xrandr --output DP-1 --mode 1920x1080 
  fi
fi

if [ -n "$laptopMonitorExists" ]
then
    if [ -z "$laptopLidState" ]
    then
        bash lid-closed.sh
    else
        bash lid-open.sh
        if [ -n "$dp3Exists" ]
        then
          xrandr --output eDP-1 --mode 1920x1080 --right-of DP-3
        elif [ -n "$dp1Exists" ]
        then
          xrandr --output eDP-1 --mode 1920x1080 --right-of DP-1
        else
          xrandr --output eDP-1 --mode 1920x1080 
        fi
    fi
fi

if [ -n "$dp2Exists" ]
then
  if [ -n "$laptopLidState" ]
  then
    xrandr --output DP-2 --mode 1920x1080 --same-as eDP-1
  else
    xrandr --output DP-2 --mode 1920x1080 
  fi
fi

feh --bg-scale ~/.config/i3/background.jpg



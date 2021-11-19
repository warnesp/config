#!/bin/bash
xrandr --output DP-1 --mode 1680x1050
xrandr --output DP-3 --mode 1680x1050 --right-of DP-1
xrandr --output eDP-1 --mode 1920x1080 --right-of DP-3

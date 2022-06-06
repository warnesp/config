#!/bin/bash

echo "Bat0: $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed -e '/percentage/!d;s/[[:space:]]//g;s/percentage://g')"

echo "Bat1: $(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | sed -e '/percentage/!d;s/[[:space:]]//g;s/percentage://g')"


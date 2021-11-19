#!/bin/bash
tempbg='/tmp/screen.png'
icon="$HOME/.config/i3/icon.png"

##check ImageMagick
if ! command -v import &> /dev/null
then
    echo "ImageMagick not installed"
    exit
fi

##grab screenshot
import -window root "$tempbg"

#scrot "$tmpbg"

##pixelate
convert "$tempbg" -scale 8% -scale 1250% "$tempbg"
#convert "$tempbg" -scale 10% -scale 1000% "$tempbg"

##blur
#convert "$tempbg" -blur 18,5 "$tempbg"

#pixel border
#bordereffects -s 15 -d 5 -c 0 -g 5 -p 2 -b '#2f345f' "$tempbg" "$tempbg"

#add icon
convert "$tempbg" "$icon" -gravity center -composite -matte "$tempbg"
#convert "$tempbg" "$icon" -geometry +775+455 -composite -matte "$tempbg"
#convert "$tempbg" "$icon" -geometry +2455+455 -composite -matte "$tempbg"

##blocky multiple screens
#convert "$tempbg" -scale 8% -scale 1250% "$icon" -geometry +775+455 -composite -matte "$icon" -geometry +2455+455 -composite -matte "$tempbg"  

##blocky, one screen
#convert "$tempbg" -scale 8% -scale 1250% "$icon" -gravity center -composite -matte "$tempbg"  

#convert "$tempbg" -colors 16 -depth 8 +dither -despeckle "$tempbg"

i3lock -i "$tempbg"
rm "$tempbg"

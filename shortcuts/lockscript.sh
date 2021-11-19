#!/bin/bash
tempbg='/tmp/screen.png'
icon="$HOME/.config/i3/icon.png"

#call ImageMagick
if ! command -v import &> /dev/null
then
    echo "ImageMagick not installed"
    exit
fi

import -window root "$tempbg"

#scrot "$tmpbg"

#pixelate
#convert "$tempbg" -scale 8% -scale 1250% "$tempbg"
#convert "$tempbg" -scale 10% -scale 1000% "$tempbg"

#blur
#convert "$tempbg" -blur 18,5 "$tempbg"

#bordereffects -s 15 -d 5 -c 0 -g 5 -p 2 -b '#2f345f' "$tempbg" "$tempbg"

#convert "$tempbg" "$icon" -gravity center -composite -matte "$tempbg"
#convert "$tempbg" "$icon" -geometry +775+455 -composite -matte "$tempbg"
#convert "$tempbg" "$icon" -geometry +2455+455 -composite -matte "$tempbg"
convert "$tempbg" -scale 8% -scale 1250% "$icon" -geometry +775+455 -composite -matte "$icon" -geometry +2455+455 -composite -matte "$tempbg"  
#convert "$tempbg" -colors 16 -depth 8 +dither -despeckle "$tempbg"
i3lock -i "$tempbg"
rm "$tempbg"

swayidle -w timeout 600 'swaylock --screenshots --clock --indicator --grace 15 --fade-in 1 --effect-pixelate 25 --effect-scale 2' \
            timeout 1200 'loginctl suspend' \
            before-sleep 'swaylock --screenshots --clock --indicator --fade-in 1 --effect-pixelate 25 --effect-scale 2' &

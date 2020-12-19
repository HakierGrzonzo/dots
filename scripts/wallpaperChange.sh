#!/bin/bash
WALLPAPER_tmp="${HOME}/Pictures/wallpaper_name"
WALLPAPER="${HOME}/Pictures/wallpaper.png"
DIR="${HOME}/Pictures/wallpapers/"

touch $WALLPAPER_tmp

CurrentWall=$(cat $WALLPAPER_tmp )

ls $DIR |sort -R |tail -n 2 |while read file; do
	if [ "$file" == "$CurrentWall" ]; then
		echo "skipping $file"
	else
		$HOME/scripts/blendWP.sh "${DIR}${file}"
		cp "${DIR}${file}" $WALLPAPER
		echo $file > $WALLPAPER_tmp
		break
	fi
done

rm -r "${HOME}/.cache/wal"
wpg -s ~/Pictures/wallpapers/$(cat ~/Pictures/wallpaper_name)
wal -n -i $WALLPAPER --saturate 0.7 
pywalfox update

. "${HOME}/.cache/wal/colors.sh"

# set rgb using ckb next
killall rgbwal
rgbwal $color1 $color2 $color3 $color4 $color5 $color6 &
disown


# Set the border colors.
bspc config normal_border_color "$color15"
bspc config active_border_color "$color2"
bspc config focused_border_color "$color1"
# Use the line below if you are on bspwm >= 0.9.4
bspc config presel_feedback_color "$color1"

spicetify update



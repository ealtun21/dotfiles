#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
FILE="$HOME/.config/waybar/style.css"
IMPORT1='@import "../../.cache/wal/colors-waybar.css";'
IMPORT2='@import "../../.cache/wal/rgba_colors.css";'

if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword decoration:active_opacity 1;\
        keyword decoration:inactive_opacity 1;\
        keyword decoration:fullscreen_opacity 1;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    
    sed -i "s|$IMPORT2|$IMPORT1|" "$FILE"
    killall -SIGUSR2 waybar


    exit

fi
sed -i "s|$IMPORT1|$IMPORT2|" "$FILE"
killall -SIGUSR2 waybar
hyprctl reload

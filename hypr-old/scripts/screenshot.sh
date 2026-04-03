#!/bin/zsh

DIR="$HOME/Pictures/screenshots"
mkdir -p "$DIR"

FILE="$DIR/$(date '+%Y-%m-%d_%H-%M-%S').png"

grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE"
notify-send "Screenshot saved" "$(basename "$FILE")"


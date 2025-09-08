#!/usr/bin/env bash

FILTER="*.png *.jpg *.jpeg|Image Files"

ICON="$HOME/4nix/assets/matunoti.png"

SEL_WALL=$(kdialog --getopenfilename "$HOME/Pictures" "$FILTER")

if [ -z "$SEL_WALL" ]; then
  notify-send -i "$ICON" "Matugen" "no image selected!"
  echo -e "\n~ NO IMAGE SELECTED! EXITING.\n"; exit
fi

echo "$SEL_WALL" > "$HOME/.cache/last_wall.nix"
echo -e "\n* APPLYING THEME USING $SEL_WALL\n"

matugen image "$SEL_WALL" || {
  notify-send -i "$ICON" "Matugen" "manual intervention needed!"
  exit
}

notify-send "Matugen" "$SEL_WALL" -i "$SEL_WALL"

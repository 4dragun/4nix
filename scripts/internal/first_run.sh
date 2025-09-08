#!/usr/bin/env bash

FLAG="$HOME/.config/first_run.nix"
WALL="$HOME/.cache/last_wall.nix"
ICON="$HOME/4nix/assets/4.png"

if [ ! -f "$FLAG" ]; then
  sleep 0.5
  notify-send -i "$ICON" "4NIX" "Welcome to Hyprland ✨"
  $HOME/4nix/scripts/wallpaper/pick.sh || exit

  if [ -f "$WALL" ]; then
    touch "$FLAG"
  fi
fi

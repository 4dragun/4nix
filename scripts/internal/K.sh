#!/usr/bin/env bash

KEEP="erase deliver pig moment chimney exit essay faith anchor twin \
      strong rebuild perfect pipe shadow license salute flip fashion \
      follow boil run kitchen"

ICON="$HOME/4nix/assets/4.png"

wl-copy -n $KEEP || exit

notify-send "Nixy Linux" "finished" -i "$ICON"

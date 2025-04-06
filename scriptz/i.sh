#!/usr/bin/env bash
./4nix/scriptz/h.sh
sudo nixos-rebuild boot --flake ~/4nix
read -p "REBOOTING IN NEXT STEP, CLICK TO CANCEL..."
sync && sync && sync && systemctl reboot

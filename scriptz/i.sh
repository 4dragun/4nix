#!/usr/bin/env bash

bash ~/4nix/scriptz/h.sh
sudo nixos-rebuild boot --flake ~/4nix
read -p "INTIALISATION COMPLETE, REBOOT NOW..? " ras
if [[ $ras = y ]]; then
  reboot
else
  echo "PLEASE REBOOT MANUALLY..!"
fi

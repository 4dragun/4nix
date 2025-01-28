#!/usr/bin/env bash

bash ~/4nix/scriptz/h.sh
sudo nixos-rebuild boot --flake ~/4nix
read -p "INTIALISATION COMPLETE, PLEASE REBOOT"

{ config, pkgs, inputs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}

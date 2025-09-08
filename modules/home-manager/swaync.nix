{ config, pkgs, inputs, ... }:

{
  services.swaync = {
    enable = true;
    style = "~/.config/MATUOUTS/matuswaync.css";
  };
}

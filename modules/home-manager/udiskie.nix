{ config, pkgs, inputs, ... }:

{
  services.udiskie = {
    enable = true;
    tray = "auto";
  };
}

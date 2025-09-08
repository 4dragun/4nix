{ config, pkgs, inputs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      font = "Rubik 12";
      display-drun = "";
      drun-display-format = "{icon}{name}";
      show-icons = true;
    };
    theme = "~/.config/MATUOUTS/maturofimain.rasi";
  };
}

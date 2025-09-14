{ config, pkgs, inputs, ... }:

{
  programs.rofi = {
    enable = true;
    extraConfig = {
      font = "Rubik 12";
      display-drun = "";
      drun-display-format = "{icon}{name}";
      show-icons = true;
    };
    theme = "~/.config/MATUOUTS/maturofimain.rasi";
  };
}

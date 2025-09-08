{ config, pkgs, inputs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
    font.name = "Rubik";
    iconTheme.name = "matutela";
    gtk3.extraCss = "@import 'colors.css';";
    gtk4.extraCss = "@import 'colors.css';";
  };
}

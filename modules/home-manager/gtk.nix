{ config, pkgs, inputs, ... }:

{
  gtk = {
    enable = true;
    gtk3 = {
       iconTheme.name = "matutela";
       extraCss = "@import 'colors.css';";
       theme = {
	 package = pkgs.adw-gtk3;
	 name = "adw-gtk3-dark";
       };
       font.name = "Rubik Regular";
       cursorTheme.name = "Bibata-Modern-Classic";
    };
    gtk4 = {
       iconTheme.name = "matutela";
       extraCss = "@import 'colors.css';";
       theme = {
	  package = pkgs.adw-gtk3;
	  name = "adw-gtk3-dark";
       };
       font.name = "Rubik Regular";
       cursorTheme.name = "Bibata-Modern-Classic";
    };

  }; 
}

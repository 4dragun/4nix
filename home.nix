{ inputs, config, pkgs, ... }:

{
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.11";
    file = {
      "./.config/fuzzel".source = ./confz/fuzzel;
      "./.config/hypr".source = ./confz/hypr;
      "./.config/kitty".source = ./confz/kitty;
      "./.config/swaync".source = ./confz/swaync;
      "./.config/swayosd".source = ./confz/swayosd;
      "./.config/uwsm".source = ./confz/uwsm;
      "./.config/waybar".source = ./confz/waybar;
    };
  };
  
  programs = {
    home-manager.enable = true;
    nvchad = {
      enable = true;
      hm-activation = false;
    };
  };

  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];

  gtk = {
    enable = true;
    font.name = "Fira Sans Medium";
    iconTheme.name = "BeautyLine";
    cursorTheme.name = "Bibata-Modern-Classic";
    theme.name = "Sweet-Dark";
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "qtct";
  };
}

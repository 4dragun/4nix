{ inputs, config, pkgs, ... }:

{
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.11";
    packages = with pkgs; [
      brave
      gnome-boxes
      hyprpanel
      hyprpicker
      brightnessctl
      wl-clipboard
      udiskie
      clipse
      emote
      nautilus
      pavucontrol
      eog
      grimblast
      telegram-desktop
      qbittorrent
      git-credential-manager
      hyprpolkitagent
    ];
    file = {
      "./.config/uwsm".source = ./confz/uwsm;
      "./.config/hypr".source = ./confz/hypr;
    };
  };
  
  programs = {
    home-manager.enable = true;
    yazi.enable = true;
    bat.enable = true;
    lsd.enable = true;
    fastfetch.enable = true;
    btop.enable = true;
    mpv.enable = true;
  };

  imports = [
    inputs.nvchad4nix.homeManagerModule
    ./modulez/nvchad.nix
    ./modulez/kitty.nix
    ./modulez/git.nix
    ./modulez/fuzzel.nix
    ./modulez/fish.nix
  ];

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  qt.enable = true;
}

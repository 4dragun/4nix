{ config, pkgs, inputs, ... }:

{
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "25.05";

    packages = with pkgs; [
      inputs.matugen.packages.${system}.default
      gnome-boxes
      wl-clipboard
      nvchad
      brave
      grimblast
      brightnessctl
      libnotify
      git-credential-manager
      darkly
      kdePackages.kdialog
    ];

    file = {
      # ".screenrc".source = dotfiles/screenrc;
      ".config/kwalletrc".text = ''
        [Wallet]
        Enabled=false
      '';
    };

    sessionVariables = {
    # EDITOR = "emacs";
    };
  };

  xdg.portal = {
    enable = true;
    config.hyprland.default = "hyprland;kde";
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
    ];
  };

  programs = {
    home-manager.enable = true;
    starship.enable = true;
    yazi.enable = true;
    btop.enable = true;
  };

  services = {
    hyprpaper.enable = true;
    clipse.enable = true;
  };

  imports = [
    ./modules/home-manager/waybar.nix
    ./modules/home-manager/rofi.nix
    ./modules/home-manager/udiskie.nix
    ./modules/home-manager/gtk.nix
    ./modules/home-manager/qt.nix
    ./modules/home-manager/swaync.nix
    ./modules/home-manager/kitty.nix
    ./modules/home-manager/fish.nix
    ./modules/home-manager/git.nix
  ];
}

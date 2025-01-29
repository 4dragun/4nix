{ inputs, config, pkgs, ... }:

{
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.11";
    packages = with pkgs; [
      brave
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
    ];
    file = {
      "./.config/uwsm/env".source = ./confz/uwsm/env;
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
    ./modulez/hyprland.nix
    ./modulez/hypridle.nix
    ./modulez/hyprlock.nix
    ./modulez/kitty.nix
    ./modulez/git.nix
    ./modulez/fuzzel.nix
    ./modulez/zsh.nix
    # ./modulez/fish.nix
    # ./modulez/oh-my-posh.nix
  ];

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };
  
  stylix.targets.hyprlock.enable = false;
}

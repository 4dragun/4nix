{ inputs, config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./modulez/bafish.nix
    ./modulez/fish.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixy";
    networkmanager.enable = true;
  };
  
  time.timeZone = "Asia/Kolkata";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  users = {
    users.nixy = {
      isNormalUser = true;
      description = "nixy";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  environment.systemPackages = with pkgs; [
    brave
    gnome-boxes
    hyprpicker
    hyprsysteminfo
    hyprpaper
    brightnessctl
    hypridle
    wl-clipboard
    udiskie
    clipse
    emote
    pavucontrol
    eog
    grimblast
    telegram-desktop
    qbittorrent
    git-credential-manager
    hyprpolkitagent
    lsd
    fastfetch
    btop
    mpv
    swaynotificationcenter
    swayosd
    waybar
    networkmanagerapplet
    nwg-look
    fuzzel
    kitty
    beauty-line-icon-theme
    sweet
    bibata-cursors
    xdg-user-dirs
    file-roller
  ];

  programs = {
    hyprland = {
      enable = true;
      withUWSM  = true;
    };
    hyprlock.enable = true;
    yazi.enable = true;
    bat.enable = true;
    git.enable = true;
    xfconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  services = {
    logind.extraConfig = "
      HandlePowerKey=suspend-then-hibernate
      HandleLidSwitch=suspend-then-hibernate
    ";
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    udisks2.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    blueman.enable = true;
    power-profiles-daemon.enable = true;
  };

  fonts.packages = with pkgs; [
    fira-sans
    font-awesome
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  systemd.sleep.extraConfig = "HibernateDelaySec=1800";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}

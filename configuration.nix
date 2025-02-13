{ inputs, config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./modulez/+bafish.nix
    ./modulez/+stylix.nix
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

  programs = {
    hyprland = {
      enable = true;
      withUWSM  = true;
    };
    nh = {
      enable = true;
      flake = "/home/nixy/4nix";
    };
    hyprlock.enable = true;
  };

  services = {
    logind.extraConfig = "
      HandlePowerKey=suspend-then-hibernate
      HandleLidSwitch=suspend-then-hibernate
    ";
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
    };
    udisks2.enable = true;
    upower.enable = true;
    blueman.enable = true;
    hypridle.enable = true;
    power-profiles-daemon.enable = true;
  };

  # EDIT THIS STUFFF
  # services.pipewire.extraConfig.pipewire."92-low-latency" = {
  #   "context.properties" = {
  #     "default.clock.rate" = 48000;
  #     "default.clock.quantum" = 2400;
  #     "default.clock.min-quantum" = 2400;
  #     "default.clock.max-quantum" = 2400;
  #   };
  # };

  fonts.packages = with pkgs; [
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

  systemd.sleep.extraConfig = "HibernateDelaySec=30m";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}

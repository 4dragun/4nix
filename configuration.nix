{ inputs, config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./modulez/+auto-cpufreq.nix
    ./modulez/+stylix.nix
    ./modulez/+nh.nix
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
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    };
    defaultUserShell = pkgs.zsh;
    # defaultUserShell = pkgs.fish;
  };

  programs = {
    zsh.enable = true;
    # fish.enable = true;
    virt-manager.enable = true;
    hyprland = {
      enable = true;
      withUWSM  = true;
    };
  };

  services = {
    logind.extraConfig = "
      HandlePowerKey=suspend-then-hibernate
      HandleLidSwitch=suspend-then-hibernate
    ";
    udisks2.enable = true;
    upower.enable = true;
    blueman.enable = true;
    thermald.enable = true;
  };

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 2400;
      "default.clock.min-quantum" = 2400;
      "default.clock.max-quantum" = 2400;
    };
  };

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
  virtualisation.libvirtd.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  security.pam.services.hyprlock = {};
  system.stateVersion = "24.11";
}

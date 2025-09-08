{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Kolkata";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  
  nixpkgs.overlays = [
    (final: prev: {
        nvchad = inputs.nix4nvchad.packages."${pkgs.system}".nvchad;
    })
  ];
  
  security.rtkit.enable = true;
  # virtualisation.libvirtd.enable = true;

  services = {
    udisks2.enable = true;
    power-profiles-daemon.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    displayManager.sddm = {
      enable = true;
      theme = "";
      wayland.enable = true;
      extraPackages = [];
    };

    desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = false;
    };
  };

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.aurorae
    kdePackages.plasma-browser-integration
    kdePackages.plasma-workspace-wallpapers
    kdePackages.konsole
    kdePackages.kwin-x11
    kdePackages.elisa
    kdePackages.okular
    kdePackages.kate
    kdePackages.ktexteditor
    kdePackages.khelpcenter
    kdePackages.spectacle
  ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users.nixy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  programs.hyprland.enable = true;

  fonts.packages = with pkgs; [
    rubik
    nerd-fonts.jetbrains-mono
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "25.05";
}

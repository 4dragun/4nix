{ config, pkgs, inputs, ... }:

let
  kdePackages = pkgs.kdePackages;
  activationScript = ''
    # will be rebuilt automatically
    rm -fv "$HOME/.cache/ksycoca"*
  '';
in

{
  system.userActivationScripts.rebuildSycoca = activationScript;
  systemd.user.services.nixos-rebuild-sycoca = {
    description = "Rebuild KDE system configuration cache";
    wantedBy = [ "graphical-session-pre.target" ];
    serviceConfig.Type = "oneshot";
    script = activationScript;
  };
  environment.sessionVariables.XDG_CONFIG_DIRS = [ "$HOME/.config/kdedefaults" ];

    # Needed for things that depend on other store.kde.org packages to install correctly,
    # notably Plasma look-and-feel packages (a.k.a. Global Themes)
    #
    # FIXME: this is annoyingly impure and should really be fixed at source level somehow,
    # but kpackage is a library so we can't just wrap the one thing invoking it and be done.
    # This also means things won't work for people not on Plasma, but at least this way it
    # works for SOME people.
    environment.sessionVariables.KPACKAGE_DEP_RESOLVERS_PATH = "${kdePackages.frameworkintegration.out}/libexec/kf6/kpackagehandlers";

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

  hardware.bluetooth.enable = true;
  
  nixpkgs.overlays = [
    (final: prev: {
        nvchad = inputs.nix4nvchad.packages."${pkgs.system}".nvchad;
    })
  ];
  
  security = {
    rtkit.enable = true;
    pam.services.hyprlock.enable = true;
  };
  # virtualisation.libvirtd.enable = true;
  
  xdg.menus.enable = true;
  xdg.mime.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.hyprland.default = "hyprland;kde";
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
    ];
  };

  services = {
    udisks2.enable = true;
    power-profiles-daemon.enable = true;
    blueman.enable = true;

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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "25.05";
}

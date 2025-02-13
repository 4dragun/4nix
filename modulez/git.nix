{ inputs, config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "4";
    userEmail = "4";
    extraConfig.credential = {
      helper = "manager";
      credentialStore = "cache";
    };
  };
}

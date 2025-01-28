{ inputs, config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "4";
    userEmail = "";
    extraConfig.credential = {
      helper = "manager";
      credentialStore = "cache";
    };
  };
}

{ config, pkgs, inputs, ... }:

{
  programs.git = {
    enable = true;
    userName = "4";
    userEmail = "4";
    extraConfig = {
      credential = {
        credentialStore = "cache";
        cacheOptions = "--timeout 3600";
        helper = [ "" "/run/current-system/sw/bin/git-credential-manager" ];
      };
      "credential \"https://dev.azure.com\"" = {
        useHttpPath = true;
      };
    };
  };
}

{ config, pkgs, inputs, ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "4";
        email = "4";
      };
      credential = {
        credentialStore = "cache";
        cacheOptions = "--timeout 3600";
        helper = [
          ""
          "/etc/profiles/per-user/nixy/bin/git-credential-manager"
        ];
      };
      "credential \"https://dev.azure.com\"" = {
        userHttpPath = true;
      };
    };
  };
}

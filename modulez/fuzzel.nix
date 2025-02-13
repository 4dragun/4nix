{ inputs, config, pkgs, lib, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "Adwaita";
        terminal = "kitty";
        font = lib.mkForce "JetBrainsMono NF:size=10";
        use-bold = "yes";
        launch-prefix = "'uwsm app -- '";
      };
      border.width = 2;
    };
  };
}

{ inputs, config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "BeautyLine";
        terminal = "kitty";
        font = "JetBrainsMono NF:size=10";
        use-bold = "yes";
        launch-prefix = "'uwsm app -- '";
      };
      border.width = 2;
    };
  };
}

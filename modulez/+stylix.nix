{ inputs, config, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ../wallz/Backyard.png;
    polarity = "dark";
    fonts = {
      sizes = {
        terminal = 13;
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NF";
      };
      serif = {
        package = pkgs.hubot-sans;
        name = "Hubot Sans";
      };
      sansSerif = config.stylix.fonts.serif;
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
}

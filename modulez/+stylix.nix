{ inputs, config, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    image = ../wallz/5m5kLI9.png;
    polarity = "dark";
    fonts = {
      sizes = {
        terminal = 13;
        applications = 13;
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

{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;
    hm-activation = false;
  };

  home.file = {
    ".config/nvim/lua/chadrc.lua".source = ../../dotfiles/nvim/chadrc.lua;
  };
}

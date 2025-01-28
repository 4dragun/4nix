{ inputs, config, pkgs, ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/nixy/4nix";
  };
}

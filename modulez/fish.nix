{ inputs, config, pkgs, ...}:

{
  programs.fish = {
    enable = true;
    shellInit = "
      set -U fish_greeting
      fish_config prompt choose scales
    ";
    shellAliases = {
      "ls"  = "lsd";
      "cat" = "bat";
      "y"   = "yazi";
      "gc"  = "~/4nix/scriptz/gc.sh";
      "gp"  = "~/4nix/scriptz/gp.sh";
      "b"   = "~/4nix/scriptz/b.sh";
      "h"   = "~/4nix/scriptz/h.sh";
      "u"   = "h && nh os switch -a";
      "uf"  = "h && nh os switch -a -u";
      "ub"  = "h && nh os boot -a";
      "c"   = "nh clean all";
    };
  };
}

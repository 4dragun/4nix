{ config, pkgs, inputs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = "
      function starship_transient_prompt_func
	      tput cuu1
	      starship module character
      end

      function prompt_newline --on-event fish_postexec
	      echo
      end

      function fish_greeting
      end
    ";
    shellAliases = {
      y     = "yazi";
      ls    = "lsd";
      cat   = "bat";
      gc    = "~/4nix/scripts/git/commit.sh";
      gf    = "~/4nix/scripts/git/force.sh";
      s     = "~/4nix/scripts/utils/create.sh";
      clear = "command clear; commandline -f clear-screen";
    };
  };
}

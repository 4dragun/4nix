{ inputs, config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history.path = ".config/zsh/zsh_history";
    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
        "pattern"
        "regexp"
        "cursor"
        "root"
        "line"
      ];
    };
    prezto = {
      enable = true;
      prompt.theme = "powerlevel10k";
    };
    initExtra = "
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
      source ~/.config/zsh/.p10k.zsh
    ";
    shellAliases = {
      "ls"  = "lsd";
      "cat" = "bat";
      "y"   = "yazi";
      "z"   = "~/4nix/scriptz/z.sh";
      "g"   = "~/4nix/scriptz/g.sh";
      "gp"  = "~/4nix/scriptz/gp.sh";
      "b"   = "~/4nix/scriptz/b.sh";
      "h"   = "~/4nix/scriptz/h.sh";
      "u"   = "h && nh os switch -a";
      "uf"  = "h && nh os switch -u -a";
      "c"   = "nh clean all";
    };
  };
}

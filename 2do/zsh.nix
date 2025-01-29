{ inputs, config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    historySubstringSearch.enable = true;
    dotDir = ".config/zsh";
    history.path = "${config.xdg.dataHome}/zsh/zsh_history";
    autosuggestion = {
      enable = true;
      strategy = [ "completion" ];
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
  };
}

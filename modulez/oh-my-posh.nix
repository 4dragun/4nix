{ inputs, config, pkgs, ... }:

{
  programs.oh-my-posh = {
    enable = true;
    useTheme = "M365Princess";
  };
}

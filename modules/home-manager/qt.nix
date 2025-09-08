{ config, pkgs, inputs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "kde";
  };
}

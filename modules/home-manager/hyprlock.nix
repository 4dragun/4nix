{ config, pkgs, inputs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      source = "../MATUOUTS/matuhyprland.conf";
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };
      background = {
        path = "$image";
        blur_passes = 3;
        brightness = 0.5;
      };
      image = {
        path = "~/Downloads/cross.jpg";
        size = 70;
        border_size = 1;
        border_color = "rgba(0, 0, 0, 0.3)";
        position = "0, -340";
      };
      input-field = {
        size = "111, 55";
        position = "0, -432";
        fade_on_empty	= false;
        outline_thickness	= 0;
        font_family = "Rubik Regular";
        font_color = "$primary_fixed_dim";
        inner_color = "rgba(0, 0, 0, 0.3)";
        outer_color = "rgba(0, 0, 0, 0)";
      };
      label = [
        {
          text = "$TIME";
          color = "$primary";
          font_size = 90;
          font_family = "Rubik Regular";
          position = "0, 340";
        }
        {
          text = "󰍁";
          color = "$primary_fixed_dim";
          font_size = 20;
          position = "0, 456";
        }
        {
          text = "  Hyprland";
          color = "$primary_fixed";
          font_size = 11;
          font_family = "Rubik Italic";
          position = "-900, 520";
        }
        {
          text = "  $LAYOUT";
          color = "$primary_fixed";
          font_size = 11;
          font_family = "Rubik Regular";
          position = "890, 520";
        }
        # {
        #   text = cmd[update:1000] echo "$(~/4nix/scripts/internal/hyprlock_bat.sh)"
        #   color = $primary_fixed
        #   font_size = 11
        #   font_family = Rubik Regular
        #   position = 760, 520
        # }
        # {
        #   text = cmd[update:1000] echo "$(date "+%A %b %d")"
        #   color = $primary
        #   font_size = 15
        #   font_family = Rubik Regular
        #   position = 0, 253
        # }
      ];
    };
  };
}

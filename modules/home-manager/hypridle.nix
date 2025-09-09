{ config, pkgs, inputs, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 360;
          on-timeout = "brightnessctl -s && brightnessctl set 3%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 420;
          on-timeout = "systemctl suspend-then-hibernate";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}

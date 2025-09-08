{ config, pkgs, inputs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family             = "JetBrainsMono Nerd Font";
      bold_font               = "JetBrainsMonoNF-Bold";
      italic_font             = "JetBrainsMonoNF-Italic";
      bold_italic_font        = "JetBrainsMonoNF-BoldItalic";
      font_size               = "13";
      shell                   = "fish";
      confirm_os_window_close = "0";
      window_padding_width    = "20";
      cursor_shape            = "beam";
      cursor_shape_unfocused  = "unchanged";
      cursor_trail            = "1";
      include                 = "matukitty.conf";
    };
  };
}

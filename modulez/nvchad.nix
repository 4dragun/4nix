{ inputs, configs, pkgs, ... }:

{
  programs.nvchad = {
    enable = true;
    backup = false;
    chadrcConfig = "
      local M = {}
      M.base46 = { theme = 'catppuccin' }
      M.nvdash = { load_on_startup = true }
      M.ui = {
        statusline = {
          theme = 'minimal',
          separator_style = 'round'
        }
      }
      return M
    ";
  };
}

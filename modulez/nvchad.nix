{ inputs, configs, pkgs, ... }:

{
  programs.nvchad = {
    enable = true;
    backup = false;
    chadrcConfig = "
      local M = {}
      M.base46 = {
        theme = 'gruvbox',
        transparency = true,
        hl_override = {
          Comment = { italic = true },
          ["@comment"] = { italic = true },
        },
      }
      M.nvdash = { load_on_startup = true }
      M.ui = {
        statusline = {
          theme = 'minimal',
          separator_style = 'round'
        },
        tabufline = { lazyload = false }
      }
      return M
    ";
  };
}

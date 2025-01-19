return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      --Load the ColorScheme
      vim.cmd([[colorscheme gruvbox]])
    end,
  }
}

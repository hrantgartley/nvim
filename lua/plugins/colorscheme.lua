return {
  "Mofiqul/dracula.nvim",
  "morhetz/gruvbox",
  "catppuccin/nvim",
  {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      transparent = true
    end,
  },
}

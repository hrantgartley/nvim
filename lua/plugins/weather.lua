return {
  "lazymaniac/wttr.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    location = "",
  },
  require("lualine").setup({
    sections = {
      lualine_x = { "require'wttr'.text" },
    },
  }),
}

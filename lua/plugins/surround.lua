return {
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gza",
        delete = "gzd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gzr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    {
      "NStefan002/visual-surround.nvim",
      config = function()
        require("visual-surround").setup({
          -- your config
        })
      end,
      -- or if you don't want to change defaults
      config = true,
    },
  },
}

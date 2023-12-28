return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      on_highlights = function(highlights, colors)
        highlights["@operator"] = {
          fg = "#b44bbd",
        }
        highlights["@type"] = {
          fg = "#FFFFFF",
        }
        highlights["@variable"] = {
          fg = "#FFFFFF",
        }
      end,
    })
  end,
}

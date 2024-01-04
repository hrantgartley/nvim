vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#89CFF0" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#FF69B4" })
vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#FF0000" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#FF0000" })
return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Define emojis for different kinds of completion items
    local kinds = {
      Class = " Class", -- Emoji for classes
      Color = " Color", -- Emoji for colors
      Constant = " Constant", -- Emoji for constants
      Enum = " Enum", -- Emoji for enums
      EnumMember = " Enum Member", -- Emoji for enum members
      Field = " Field", -- Emoji for fields
      File = " File", -- Emoji for files
      Folder = " Folder", -- Emoji for folders
      Function = "󰡱 Function", -- Emoji for functions
      Interface = " Interface", -- Emoji for interfaces
      Keyword = " Keyword", -- Emoji for keywords
      Method = " Method", -- Emoji for methods
      Module = "󰕳 Module", -- Emoji for modules
      Operator = " Operator", -- Emoji for operators
      Property = " Property", -- Emoji for properties
      Reference = " Reference", -- Emoji for references
      Snippet = " Snippet", -- Emoji for snippets
      Struct = " Struct", -- Emoji for structs
      Text = " Text", -- Emoji for text
      TypeParameter = " Typed Param", -- Emoji for type parameters
      Unit = "󰭍 Unit", -- Emoji for units
      Value = "󱇇 Value", -- Emoji for values
      Variable = " Variable", -- Emoji for variables
    }
    local diagnostics = {
      Error = "😡",
      Warn = " ",
      Hint = " ",
      Info = " ",
    }
    opts.formatting = {
      format = function(entry, vim_item)
        vim_item.kind = kinds[vim_item.kind] or vim_item.kind

        if entry.source and entry.source.name then
          local diag = diagnostics[entry.source.name]
          if diag then
            vim_item.menu = diag .. vim_item.menu
          end
        end

        return vim_item
      end,
    }

    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
      { name = "emoji" },
    }))
  end,
}

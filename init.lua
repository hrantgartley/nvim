require("config.lazy")
-- require("notify").setup({
--   background_colour = "#FFFFFF",
-- })

-- require("tokyonight").setup({
--   transparent = true,
--   styles = {
--     sidebars = "transparent",
--     floats = "transparent",
--   },
--   lazy = true,
-- })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")

require("lspconfig").clangd.setup({
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
    "--query-driver=/usr/local/bin/g++-13",
  },
  lazy = true,
})

-- Function to check and set the color scheme based on the time
local function set_color_scheme()
  local current_hour = tonumber(os.date("%H"))

  if current_hour >= 6 and current_hour < 19 then
    vim.cmd([[colorscheme tokyonight-day]])
  else
    vim.cmd([[colorscheme tokyonight-night]])
  end
end

-- Schedule to check and set color scheme periodically
local timer = vim.loop.new_timer()
timer:start(
  0,
  60000,
  vim.schedule_wrap(function()
    set_color_scheme()
  end)
)

--[[ require("neo-tree").setup({
  filesystem = {
    window = {
      mappings = {
        ["<leader>p"] = "image_wezterm", -- " or another map
      },
    },
    commands = {
      image_wezterm = function(state)
        local node = state.tree:get_node()
        if node.type == "file" then
          require("image_preview").PreviewImage(node.path)
        end
      end,
    },
    lazy = true,
  },
}) ]]

local rt = require("rust-tools")
rt.setup({
  tools = {
    hover_actions = {
      auto_focus = false,
    },
  },
  lazy = true,
})

-- add clippy to rust-analyzer
-- local lspconfig = require("lspconfig")
-- lspconfig.rust_analyzer.setup({
--   -- add clippy to rust-analyzer
--   settings = {
--     ["rust-analyzer"] = {
--       assist = {
--         importEnforceGranularity = true,
--         importPrefix = "create",
--       },
--       cargo = { allFeatures = true },
--       checkOnSave = {
--         -- default: `cargo check`
--         command = "clippy",
--         allFeatures = true,
--       },
--       inlayHints = {
--
--         lifetimeElisionHints = {
--           enable = true,
--           useParameterNames = true,
--         },
--       },
--     },
--   },
-- })

--
require("lspconfig").intelephense.setup({
  settings = {
    intelephense = {
      format = { braces = "k&r" },
    },
  },
  lazy = true,
})

require("lspconfig").emmet_ls.setup({
  filetypes = { "html", "php", "css" },
  lazy = true,
})

require("lspconfig").html.setup({
  filetypes = { "html", "php" },
  lazy = true,
})
--
--
require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })

local on_attach = function(client, bufnr)
  -- Disable hover in favor of Pyright
  client.server_capabilities.hoverProvider = false
end

require("lspconfig").ruff_lsp.setup({
  on_attach = on_attach,
  lazy = true,
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

require("config.lazy")

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
local rt = require("rust-tools")
rt.setup({
  tools = {
    hover_actions = {
      auto_focus = false,
    },
  },
  lazy = true,
})

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

require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets/" })

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  client.server_capabilities.hoverProvider = false
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

vim.opt.guicursor = ""

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "black")
      table.insert(opts.ensure_installed, "isort")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.black)
      table.insert(opts.sources, nls.builtins.formatting.isort)
      -- table.insert(opts.sources, nls.builtins.diagnostics.flake8)
    end,
  },
  -- {
  --   {
  --     "neovim/nvim-lspconfig",
  --     ft = "python",
  --     opts = {
  --       servers = {
  --         pyright = {
  --           handlers = {
  --             ["textDocument/publishDiagnostics"] = function() end,
  --           },
  --           on_attach = function(client, _)
  --             client.server_capabilities.codeActionProvider = false
  --           end,
  --           settings = {
  --             pyright = {
  --               disableOrganizeImports = true,
  --             },
  --             python = {
  --               analysis = {
  --                 autoSearchPaths = true,
  --                 typeCheckingMode = "basic",
  --                 useLibraryCodeForTypes = true,
  --               },
  --             },
  --           },
  --         },
  --         ruff_lsp = {
  --           on_attach = function(client, _)
  --             client.server_capabilities.hoverProvider = false
  --           end,
  --           init_options = {
  --             settings = {
  --               args = {},
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  --   {
  --     "raimon49/requirements.txt.vim",
  --     event = "BufReadPre requirements*.txt",
  --   },
  -- },
}

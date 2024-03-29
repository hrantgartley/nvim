return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "php",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    highlight = {
      enable = true,
    },
  },
  {
    "LhKipp/nvim-nu",
  },
  vim.treesitter.language.register("ejs", ".ejs"),
}

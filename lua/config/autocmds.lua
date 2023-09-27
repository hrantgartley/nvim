-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- Automatically run :Black (using black command-line) after saving a Python file
-- vim.cmd([[
--   autocmd BufWritePost *.py execute ':!black %'
-- ]])

-- vim.cmd([[
--   autocmd BufWritePost *.php execute ':!php-cs-fixer fix %'
-- ]])

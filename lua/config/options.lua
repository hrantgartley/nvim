-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- editor options
vim.wo.relativenumber = true
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.swapfile = false -- No need for a swpfile
vim.wo.number = true
vim.wo.cursorline = false -- No line showing for current line
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.scrolloff = 2
-- vim.o.colorcolumn = "110"
vim.o.guicursor = table.concat({
  "n-v-c-i:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
}, ",")

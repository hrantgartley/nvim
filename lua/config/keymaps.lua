-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
vim.api.nvim_create_user_command("CopilotToggle", function()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  if vim.g.copilot_enabled then
    vim.cmd("Copilot disable")
    print("Copilot OFF")
  else
    vim.cmd("Copilot enable")
    print("Copilot ON")
  end
end, { nargs = 0 })
vim.keymap.set("", "<M-\\>", ":CopilotToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("", "<leader>yc", ":YankyClearHistory<CR>", { noremap = true, silent = true })

vim.keymap.set("", "<leader>bt", ":GitBlameToggle<CR>", { noremap = true, silent = true, desc = "Toggle Git Blame" })
vim.keymap.set(
  "",
  "<leader>rs",
  ":RegexplainerToggle<CR>",
  { noremap = true, silent = true, desc = "Regex Explainer Toggle" }
)
vim.api.nvim_create_user_command("S", function()
  require("persistence").load()
end, { nargs = 0 })

vim.keymap.set(
  "",
  "<leader>tn",
  ":colorscheme tokyonight-night<CR>",
  { noremap = true, silent = true, desc = "Tokyo Night Dark Theme" }
)
vim.keymap.set(
  "",
  "<leader>yt",
  ":colorscheme vscode_modern<CR>",
  { noremap = true, silent = true, desc = "Vscode Modern Theme" }
)
vim.keymap.set("", "<leader>rr", ":LspRestart<CR>", { noremap = true, silent = true, desc = "Restart Current Lsp" })
vim.keymap.set("", "<leader>yA", ":%y<CR>", { noremap = true, silent = true, desc = "Copy Entire File" })
vim.keymap.set("", "<leader>rc", ":RunCode<CR>", { noremap = true, silent = true, desc = "Run Code" })
vim.keymap.set("", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = true, desc = "Run File" })
vim.keymap.set(
  "",
  "<leader>tt",
  ":ToggleTerm size=17<CR>",
  { noremap = true, silent = true, desc = "Toggle Floating Terminal" }
)
vim.keymap.set(
  "",
  "<leader>tb",
  ":ToggleTerm direction=float size=30<CR>",
  { noremap = true, silent = true, desc = "Toggle Big Terminal" }
)
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable New Line Comment",
})

vim.keymap.set(
  "",
  "<leader>ti",
  ":ClangdToggleInlayHints<CR>",
  { noremap = true, silent = true, desc = "Clangd Toggle Inlay Hints" }
)

vim.keymap.set({ "n", "i" }, "<S-cr>", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")

vim.keymap.set(
  "",
  "<leader>ct",
  ":ColorizerToggle<CR>",
  { noremap = true, silent = true, desc = "Toggle CSS Colorizer" }
)

vim.keymap.set("n", "<leader>gG", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })
vim.keymap.set("n", "<leader>gg", function()
  Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

-- add a keymap with leader y c to run the command yankyclear
-- change keymap for copilot to <leader>nvim_create_user_command
-- vim.api.nvim_set_keymap(
--  "n",--  "<leader>cc",
--
-- move lines (idk how to explain try it)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

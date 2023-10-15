-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

vim.keymap.set("", "<leader>yA", ":%y<CR>", { noremap = true, silent = true, desc = "Copy Entire File" })
vim.keymap.set("", "<leader>rc", ":RunCode<CR>", { noremap = true, silent = true, desc = "Run Code" })
vim.keymap.set("", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = true, desc = "Run File" })
vim.keymap.set(
  "",
  "<leader>tt",
  ":ToggleTerm<CR>",
  { noremap = true, silent = true, desc = "Toggle Floating Terminal" }
)
-- add a keymap with leader y c to run the command yankyclear
-- change keymap for copilot to <leader>nvim_create_user_command
-- vim.api.nvim_set_keymap(
--  "n",--  "<leader>cc",
--

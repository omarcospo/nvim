vim.g.mapleader = " "
vim.g.maplocalleader = " "
local function map(mode, key, action)
  vim.keymap.set(mode, key, ":call VSCodeNotify('" .. action .. "')<CR>")
end
map("n", "<leader><leader>", "workbench.action.showCommands")
--- File
map("n", "<leader>fs", "workbench.action.files.save")
map({ "n", "x" }, "<leader>wj", "workbench.action.navigateDown")
map({ "n", "x" }, "<leader>wk", "workbench.action.navigateUp")
map({ "n", "x" }, "<leader>wh", "workbench.action.navigateLeft")
map({ "n", "x" }, "<leader>wl", "workbench.action.navigateRight")
---- Goto begin and end of line
vim.keymap.set("n", "<C-l>", "$")
vim.keymap.set("n", "<C-h>", "0")
---- Move lines
vim.keymap.set("n", "<C-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<C-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

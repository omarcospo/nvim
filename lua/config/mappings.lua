---- Set <leader> key to <SPACE>
vim.g.mapleader = " "
vim.g.maplocalleader = " "
---- Window
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>")
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>")
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>")
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>wc", "<C-w>c")
vim.keymap.set("n", "<leader>wq", ":qa<CR>")
vim.keymap.set("n", "<leader>tl", "<cmd>set wrap!<CR>")
--- Window size
vim.keymap.set("n", "<left>", "<c-w>5>")
vim.keymap.set("n", "<right>", "<c-w>5<")
---- ESC with C-q
vim.keymap.set("n", "<C-q>", "<cmd>nohlsearch<CR>")
vim.keymap.set({ "i", "v" }, "<C-q>", "<Esc>")
---- Goto begin and end of line
vim.keymap.set("n", "<C-l>", "$")
vim.keymap.set("n", "<C-h>", "0")
---- File
vim.keymap.set("n", "<leader>fs", "<cmd>write!<CR>")
---- Reload
vim.keymap.set("n", "<c-,>", ":source $MYVIMRC<cr>")
---- Open CMD Line
vim.keymap.set("n", "<leader><leader>", ":")
---- Replace word
vim.keymap.set("n", "gr", function()
  return ":%s/" .. vim.fn.expand("<cword>") .. "//g<left><left>"
end)
---- Fold
vim.keymap.set("n", "<TAB>", "za")

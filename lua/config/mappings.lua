vim.o.timeoutlen = 500 --- keychord delay timeout
---- Set <leader> key to <SPACE>
vim.g.mapleader = " "
---- Set <localleader> key to <n>
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
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
vim.keymap.set("n", "<leader>fn", "<cmd>enew<CR>")
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
---- Move lines
vim.keymap.set("n", "<C-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<C-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv")
---- Comenting
vim.keymap.set("n", "gco", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>") --- above
vim.keymap.set("n", "gcO", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>") --- below

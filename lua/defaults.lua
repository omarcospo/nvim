--- BETTER DEFAULTS --------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.did_load_filetypes = 1
vim.opt.showtabline = 2
vim.opt.conceallevel = 3
vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.nvim/.undo")
--
vim.opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.opt.hidden = true -- enable background buffers
vim.opt.history = 100 -- remember n lines in history
vim.opt.updatetime = 250
vim.opt.lazyredraw = true -- faster scrolling
vim.opt.synmaxcol = 240 -- max column for syntax highlight
vim.opt.mouse = "a" -- enable your mouse
vim.opt.encoding = "utf-8" -- the encoding displayed
vim.opt.fileencoding = "utf-8" -- the encoding written to file
-- indent and tabs
vim.opt.autoindent = true -- good auto indent
vim.opt.smartcase = true -- ignore lowercase for the whole pattern
vim.opt.smartindent = true -- autoindent new lines
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2 -- change the number of space characters inserted for indentation
vim.opt.smarttab = true -- makes tabbing smarter will realize you have 2 vs 4
vim.opt.expandtab = true -- converts tabs to spaces
-- undo
vim.opt.undofile = true
--
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.backup = false -- this is recommended by coc
vim.opt.writebackup = false -- this is recommended by coc
vim.opt.updatetime = 500 -- faster completion
vim.opt.timeoutlen = 1000 -- by default timeoutlen is 1000 ms
vim.opt.autochdir = true -- working directory will always be the same as your working directory
vim.opt.fixeol = false -- turn off appending new line in the end of a file
-- folding
vim.opt.foldmethod = "syntax"
-- search
vim.opt.ignorecase = true -- ignore case if all characters in lower case
vim.opt.joinspaces = false -- join multiple spaces in search
vim.opt.smartcase = true -- when there is a one capital letter search for exact match
vim.opt.showmatch = true -- highlight search instances
-- window
vim.opt.splitbelow = true -- put new windows below current
vim.opt.splitright = true -- put new vertical splits to right
vim.opt.mouse = "a"
vim.opt.wrap = false -- dont wrap
vim.opt.termguicolors = true -- guicolor
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.linebreak = true
-- gutter
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 3
----- NEOVIDE ------------------------------------------------------
if vim.g.neovide then
	vim.opt.guifont = "IosevkaTerm_Nerd_Font:h15"
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0
	vim.g.neovide_floating_shadow = false
	vim.g.neovide_scroll_animation_length = 0.1
	vim.g.neovide_scroll_animation_far_lines = 5
	vim.g.neovide_cursor_trail_size = 0.4
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_floating_blur_amount_x = 1.0
	vim.keymap.set("n", "<sc-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<sc-c>", '"+y') -- Copy
	vim.keymap.set("n", "<sc-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<sc-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<sc-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<sc-v>", '<ESC>l"+Pli') -- Paste insert mode
	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(1.05)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1 / 1.05)
	end)
end
--- KEYBOARD -------------------------------------------------------
vim.keymap.set("n", "<leader><leader>", ":")
---- Pending operators
vim.keymap.set("o", "p", "i(", { noremap = true })
vim.keymap.set("o", "q", 'i"', { noremap = true })
-- ESC with C-q
vim.keymap.set("n", "<C-q>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "<C-q>", "<Esc>")
-- Begin and end of line
vim.keymap.set("n", "<C-l>", "$")
vim.keymap.set("n", "<C-h>", "0")
-- Window/Buffers
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>")
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>")
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>")
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>wc", "<C-w>c")
vim.keymap.set("n", "<leader>wq", "<C-w>q")
vim.keymap.set("n", "<leader>bk", "<cmd>bdelete!<CR>")
vim.keymap.set("n", "<leader>tl", "<cmd>set wrap!<CR>")
-- File
vim.keymap.set("n", "<leader>fs", "<cmd>write!<CR>")
vim.keymap.set("n", "<leader>fe", "<cmd>e ~/.config/nvim/init.lua<CR>")
-- Visual
vim.keymap.set("v", "<C-r>", ":s/")
vim.keymap.set("v", "<C-.>", ":SnipRun<CR>")

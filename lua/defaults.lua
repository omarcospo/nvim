--- BETTER DEFAULTS --------------------------------------------------------
Set.mapleader = " "
Set.maplocalleader = " "
Set.did_load_filetypes = 1
Opt.showtabline = 2
Opt.conceallevel = 3
Opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
Opt.undofile = true
Opt.undodir = vim.fn.expand("~/.nvim/.undo")
--
Opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
Opt.hidden = true -- enable background buffers
Opt.history = 100 -- remember n lines in history
Opt.updatetime = 250
Opt.lazyredraw = true -- faster scrolling
Opt.synmaxcol = 240 -- max column for syntax highlight
Opt.mouse = "a" -- enable your mouse
Opt.encoding = "utf-8" -- the encoding displayed
Opt.fileencoding = "utf-8" -- the encoding written to file
-- indent and tabs
Opt.autoindent = true -- good auto indent
Opt.smartcase = true -- ignore lowercase for the whole pattern
Opt.smartindent = true -- autoindent new lines
Opt.tabstop = 2 -- insert 2 spaces for a tab
Opt.shiftwidth = 2 -- change the number of space characters inserted for indentation
Opt.smarttab = true -- makes tabbing smarter will realize you have 2 vs 4
Opt.expandtab = true -- converts tabs to spaces
-- undo
Opt.undofile = true
--
Opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
Opt.backup = false -- this is recommended by coc
Opt.writebackup = false -- this is recommended by coc
Opt.updatetime = 500 -- faster completion
Opt.timeoutlen = 1000 -- by default timeoutlen is 1000 ms
Opt.autochdir = true -- working directory will always be the same as your working directory
Opt.fixeol = false -- turn off appending new line in the end of a file
-- folding
Opt.foldmethod = "syntax"
-- search
Opt.ignorecase = true -- ignore case if all characters in lower case
Opt.joinspaces = false -- join multiple spaces in search
Opt.smartcase = true -- when there is a one capital letter search for exact match
Opt.showmatch = true -- highlight search instances
-- window
Opt.splitbelow = true -- put new windows below current
Opt.splitright = true -- put new vertical splits to right
Opt.mouse = "a"
Opt.wrap = false -- dont wrap
Opt.termguicolors = true -- guicolor
Opt.number = true -- show line numbers
Opt.relativenumber = true -- set to relative line numbers
Opt.list = true
Opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
Opt.cursorline = true
Opt.scrolloff = 10
Opt.hlsearch = true
Opt.linebreak = true
----- NEOVIDE ------------------------------------------------------
Opt.guifont = "IosevkaTerm_Nerd_Font:h15"
Set.neovide_padding_top = 0
Set.neovide_padding_bottom = 0
Set.neovide_padding_right = 0
Set.neovide_padding_left = 0
Set.neovide_floating_shadow = false
Set.neovide_scroll_animation_length = 0.1
Set.neovide_scroll_animation_far_lines = 5
Set.neovide_cursor_trail_size = 0.4
Set.neovide_hide_mouse_when_typing = true
Set.neovide_floating_blur_amount_x = 1.0
--- KEYBOARD -------------------------------------------------------
Keymap("n", "<C-q>", "<cmd>nohlsearch<CR>")
Keymap("i", "<C-q>", "<Esc>")
Keymap("n", "<C-l>", "$")
Keymap("n", "<C-h>", "0")
-- Window/Buffers
Keymap("n", "<leader>wh", "<C-w><C-h>")
Keymap("n", "<leader>wl", "<C-w><C-l>")
Keymap("n", "<leader>wj", "<C-w><C-j>")
Keymap("n", "<leader>wk", "<C-w><C-k>")
Keymap("n", "<leader>ws", "<C-w>s")
Keymap("n", "<leader>wv", "<C-w>v")
Keymap("n", "<leader>wc", "<C-w>c")
Keymap("n", "<leader>wq", "<C-w>q")
Keymap("n", "<leader>bk", "<cmd>bdelete!<CR>")
Keymap("n", "<leader>tl", "<cmd>set wrap!<CR>")
-- File
Keymap("n", "<leader>fs", "<cmd>write!<CR>")
Keymap("n", "<leader>fe", "<cmd>e ~/.config/nvim/init.lua<CR>")
-- Visual
Keymap("v", "<C-r>", ":s/")
Keymap("v", "<C-.>", ":SnipRun<CR>")

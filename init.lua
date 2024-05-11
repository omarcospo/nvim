local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
	wf._watchfunc = function()
		return function() end
	end
end
vim.loader.enable()
--- NVIM API --------------------------------------------------------
local opt = vim.opt -- global/buffer/windows-scoped options
local cmd = vim.cmd -- command
local set = vim.g -- command
local keymap = vim.keymap.set -- set keycommand
local color = vim.api.nvim_set_hl -- set a color
local autocmd = vim.api.nvim_create_autocmd
--- BETTER DEFAULTS --------------------------------------------------------
set.mapleader = " "
set.maplocalleader = " "
set.did_load_filetypes = 1
opt.showtabline = 2
opt.conceallevel = 3
opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
opt.undofile = true
opt.undodir = vim.fn.expand("~/.nvim/.undo")
--
opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.updatetime = 250
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight
opt.mouse = "a" -- enable your mouse
opt.encoding = "utf-8" -- the encoding displayed
opt.fileencoding = "utf-8" -- the encoding written to file
-- indent and tabs
opt.autoindent = true -- good auto indent
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.smartindent = true -- autoindent new lines
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.shiftwidth = 2 -- change the number of space characters inserted for indentation
opt.smarttab = true -- makes tabbing smarter will realize you have 2 vs 4
opt.expandtab = true -- converts tabs to spaces
-- undo
opt.undofile = true
--
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.backup = false -- this is recommended by coc
opt.writebackup = false -- this is recommended by coc
opt.updatetime = 500 -- faster completion
opt.timeoutlen = 400 -- by default timeoutlen is 1000 ms
opt.autochdir = true -- working directory will always be the same as your working directory
opt.fixeol = false -- turn off appending new line in the end of a file
-- folding
opt.foldmethod = "syntax"
-- search
opt.ignorecase = true -- ignore case if all characters in lower case
opt.joinspaces = false -- join multiple spaces in search
opt.smartcase = true -- when there is a one capital letter search for exact match
opt.showmatch = true -- highlight search instances
-- window
opt.splitbelow = true -- put new windows below current
opt.splitright = true -- put new vertical splits to right
opt.mouse = "a"
opt.wrap = false -- dont wrap
opt.termguicolors = true -- guicolor
opt.number = true -- show line numbers
opt.relativenumber = true -- set to relative line numbers
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.cursorline = true
opt.scrolloff = 10
opt.hlsearch = true
opt.linebreak = true
----- NEOVIDE ------------------------------------------------------
opt.guifont = "IosevkaTerm_Nerd_Font:h15"
set.neovide_padding_top = 0
set.neovide_padding_bottom = 0
set.neovide_padding_right = 0
set.neovide_padding_left = 0
set.neovide_floating_shadow = false
set.neovide_scroll_animation_length = 0.1
set.neovide_scroll_animation_far_lines = 5
set.neovide_cursor_trail_size = 0.4
set.neovide_hide_mouse_when_typing = true
set.neovide_floating_blur_amount_x = 1.0
----- LAZY ------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
--- ALL PLUGINS -------------------------------------------------------
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	"nathom/filetype.nvim",
	-- UI
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
	},
	"akinsho/bufferline.nvim",
	"sainnhe/gruvbox-material",
	"rktjmp/lush.nvim",
	"nvim-tree/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",
	{ "nvim-telescope/telescope.nvim", version = "*" },
	{ "nvim-treesitter/nvim-treesitter", version = "*" },
	{ "nvim-lualine/lualine.nvim", version = "*" },
	{ "nvim-neo-tree/neo-tree.nvim", event = "VeryLazy" },
	-- Editing
	"phaazon/hop.nvim",
	"mateuszwieloch/automkdir.nvim",
	"Shatur/neovim-session-manager",
	{ "filipdutescu/renamer.nvim", event = "VeryLazy" },
	{
		"echasnovski/mini.pairs",
		dependencies = {
			"echasnovski/mini.cursorword",
			"echasnovski/mini.surround",
			"echasnovski/mini.ai",
		},
	},
	"numToStr/Comment.nvim",
	{ "HakonHarnes/img-clip.nvim", event = "VeryLazy", keys = { { "<leader>p", "<cmd>PasteImage<cr>" } } },
	{ "kaarmu/typst.vim", ft = "typst", lazy = false },
	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{ "neovim/nvim-lspconfig", dependencies = { "hrsh7th/cmp-nvim-lsp" }, version = "*" },
	{ "hrsh7th/nvim-cmp", version = "*", dependencies = { "hrsh7th/cmp-buffer", "onsails/lspkind.nvim" } },
	{ "ray-x/lsp_signature.nvim", version = "*", event = "VeryLazy" },
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" } },
	{ "stevearc/conform.nvim", version = "*" },
	{ "luckasRanarison/nvim-devdocs", version = "*", event = "VeryLazy" },
	"folke/trouble.nvim",
	"LukasPietzschmann/boo.nvim",
	"dnlhc/glance.nvim",
	{ "zeioth/garbage-day.nvim", event = "VeryLazy" },
	-- Tools
	{ "is0n/fm-nvim", event = "VeryLazy" },
	{ "akinsho/toggleterm.nvim", event = "VeryLazy" },
	{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },
	{ "michaelb/sniprun", build = "./install.sh" },
	"debugloop/telescope-undo.nvim",
	"smartpde/telescope-recent-files",
	{ "okuuva/auto-save.nvim", cmd = "ASToggle", event = { "InsertLeave", "TextChanged" } },
	{ "folke/which-key.nvim", event = "VeryLazy" },
	{ "NeogitOrg/neogit", dependencies = { "sindrets/diffview.nvim" }, version = "*" },
})
-- THEMING --------------------------------------------------------
cmd([[hi Normal guibg=NONE ctermbg=NONE]])
set.gruvbox_material_background = "medium"
set.gruvbox_material_foreground = "original"
set.gruvbox_material_better_performance = 1
cmd.colorscheme("gruvbox-material")
require("bufferline").setup()
-- STATUS LINE
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox_dark",
		component_separators = "|",
		section_separators = "",
		disabled_filetypes = { "neo-tree", "toggleterm" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "diagnostics", "filetype", "location" },
	},
})
----- SESSION MANAGER -----------------------------------------------------
local Path = require("plenary.path")
local config = require("session_manager.config")
require("session_manager").setup({
	sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
	session_filename_to_dir = session_filename_to_dir,
	dir_to_session_filename = dir_to_session_filename,
	autoload_mode = config.AutoloadMode.LastSession,
	autosave_last_session = true,
	autosave_ignore_not_normal = true,
	autosave_ignore_dirs = {},
	autosave_ignore_filetypes = { "gitcommit", "gitrebase" },
	autosave_ignore_buftypes = {},
	autosave_only_in_session = false,
	max_path_length = 80,
})
--- EDITING --------------------------------------------------------
require("mini.pairs").setup() -- autopairs
require("Comment").setup()
require("mini.cursorword").setup() -- highlight ocurrences of current word at point
require("mini.surround").setup() -- surround object with thingy
require("mini.ai").setup({ n_lines = 500 })
require("hop").setup() -- surround object with thingy
require("renamer").setup() -- surround object with thingy
keymap("n", "gr", function()
	require("renamer").rename()
end, { remap = true })
keymap("", "f", function()
	require("hop").hint_char1({ current_line_only = false })
end, { remap = true })
keymap("", "t", function()
	require("hop").hint_char1({ current_line_only = true })
end, { remap = true })
--- KEYBOARD -------------------------------------------------------
keymap("n", "<C-q>", "<cmd>nohlsearch<CR>")
keymap("i", "<C-q>", "<Esc>")
keymap("n", "<C-l>", "$")
keymap("n", "<C-h>", "0")
-- Window/Buffers
keymap("n", "<leader>wh", "<C-w><C-h>")
keymap("n", "<leader>wl", "<C-w><C-l>")
keymap("n", "<leader>wj", "<C-w><C-j>")
keymap("n", "<leader>wk", "<C-w><C-k>")
keymap("n", "<leader>ws", "<C-w>s")
keymap("n", "<leader>wv", "<C-w>v")
keymap("n", "<leader>wc", "<C-w>c")
keymap("n", "<leader>wq", "<C-w>q")
keymap("n", "<leader>bk", "<cmd>bdelete!<CR>")
keymap("n", "<leader>tl", "<cmd>set wrap!<CR>")
-- File
keymap("n", "<leader>fs", "<cmd>write!<CR>")
keymap("n", "<leader>fe", "<cmd>e ~/.config/nvim/init.lua<CR>")
keymap("n", "<leader>bb", "<cmd>Telescope buffers<CR>")
-- Search
keymap("n", "<leader>s", ":Telescope live_grep<CR>")
keymap("n", "<leader>fl", ":Telescope live_grep search_dirs=. '~/'<CR>")
-- Visual
keymap("v", "<C-r>", ":s/")
keymap("v", "<leader>r", ":SnipRun<CR>")
--- TELESCOPE -------------------------------------------------------
require("telescope").setup({
	defaults = {
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		mappings = {
			i = {
				["<C-q>"] = "close",
				["<C-f>"] = "select_default",
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
		},
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_mru = true,
			mappings = {
				i = {
					["<C-d>"] = "delete_buffer",
				},
			},
		},
	},
})
require("telescope").load_extension("recent_files")
keymap(
	"n",
	"<leader>fr",
	[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
	{ noremap = true, silent = true }
)
--- COMPLETION -------------------------------------------------------
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
---
require("cmp").setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "luasnip" },
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = (strings[1] or "") .. " "
			kind.menu = (strings[2] or "")
			return kind
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
})
--- Borders
color(0, "FloatBorder", { bg = "NONE", fg = "#ADADAD" }) -- BG is Padding color and FG border
color(0, "NormalFloat", { bg = "NONE" }) -- Documentation background
--- TREESITTER -------------------------------------------------------
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "html", "markdown", "python", "bash", "json", "vim", "markdown_inline", "regex" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
})
--- MASON -------------------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })
--- LSP -------------------------------------------------------
local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lsp_signature").setup({})
require("lsp_signature").on_attach({}, bufnr)
require("garbage-day").setup({})
--- LSP DIAGNOSTICS -------------------------------------------------------
require("trouble").setup()
keymap("n", "<leader>n", ":TroubleToggle<cr>")
--- LSP DOCUMENTATION -------------------------------------------------------
require("boo").setup()
keymap("n", "gd", [[<cmd>lua require('boo').boo()<CR>]], { noremap = true, silent = true })
--- LSP GLANCE -------------------------------------------------------
require("glance").setup()
keymap("n", "gf", ":Glance references<CR>", { noremap = true, silent = true })
keymap("n", "gh", ":Glance definitions<CR>", { noremap = true, silent = true })
--- DEVDOCS -------------------------------------------------------
require("nvim-devdocs").setup({
	after_open = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-q>", ":close<CR>", {})
	end,
})
keymap("n", "<leader>d", ":DevdocsOpenCurrentFloat<CR>")
--- LUASNIP -------------------------------------------------------
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
--- PYTHON -------------------------------------------------------
lsp.ruff_lsp.setup({})
lsp.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				ruff = { enabled = true },
				pycodestyle = { enabled = false },
				pyflakes = { enabled = false },
				mccabe = { enabled = false },
				flake8 = { enabled = false },
				mypy = { enabled = false },
			},
		},
	},
})
------- TYPST ----------------------------------------------------
autocmd("BufWinEnter", {
	pattern = "*.typ",
	command = "set filetype=typst",
})
lsp.typst_lsp.setup({
	settings = {
		exportPdf = "onType", -- Choose onType, onSave or never.
	},
})
--- FORMATTER -------------------------------------------------------
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format", "ruff" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	notify_on_error = false,
})
--- FILE MANAGER -------------------------------------------------------
require("fm-nvim").setup({
	edit_cmd = "edit",
	on_close = {},
	on_open = {},
	ui = {
		default = "float",
		float = {
			border = "rounded",
			float_hl = "Normal",
			border_hl = "FloatBorder",
			blend = 0,
			height = 0.8,
			width = 0.8,
			x = 0.5,
			y = 0.5,
		},
		split = {
			direction = "topleft",
			size = 24,
		},
	},
	cmds = {
		ranger_cmd = "ranger",
	},
	mappings = {
		vert_split = "<C-v>",
		horz_split = "<C-h>",
		tabedit = "<C-t>",
		edit = "<C-e>",
		ESC = "<ESC>",
	},
	broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson",
})
keymap("n", "<leader>ff", "<cmd>Ranger<CR>")
--- TERMINAL -------------------------------------------------------
require("toggleterm").setup({
	hide_numbers = true,
	shade_filetypes = {},
	autochdir = true,
	start_in_insert = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	close_on_exit = true,
	auto_scroll = true,
})
autocmd("TermOpen", {
	pattern = "*",
	command = "setlocal cursorline nocursorline",
})
keymap("n", "<leader>v", "<cmd>ToggleTerm<CR>", { remap = true }) -- toggle outside terminal
keymap("t", "<C-v>", "<cmd>ToggleTerm<CR>") -- toggle inside terminal
--- TABNINE  -------------------------------------------------------
require("tabnine").setup({
	disable_auto_comment = true,
	accept_keymap = "<C-f>",
	dismiss_keymap = "<C-]>",
	debounce_ms = 800,
	suggestion_color = { gui = "#808080", cterm = 244 },
	exclude_filetypes = { "TelescopePrompt", "NvimTree" },
	log_file_path = nil,
})
--- UNDO -------------------------------------------------------
require("telescope").load_extension("undo")
require("telescope").setup({
	extensions = {
		undo = {
			mappings = {
				i = {
					["<cr>"] = require("telescope-undo.actions").yank_additions,
					["<C-y>"] = require("telescope-undo.actions").yank_deletions,
					["<C-r>"] = require("telescope-undo.actions").restore,
				},
			},
		},
	},
})
keymap("n", "<leader>u", "<cmd>Telescope undo<cr>")
--- NEOGIT -------------------------------------------------------
require("neogit").setup({
	mappings = {
		popup = {
			["p"] = "PushPopup",
			["P"] = "PullPopup",
		},
	},
})
keymap("n", "<leader>g", "<cmd>Neogit<cr>")

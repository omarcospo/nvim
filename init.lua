local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
	wf._watchfunc = function()
		return function() end
	end
end
--- LOAD MODULE FUNCTION --------------------------------------------------------
local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end
--- NVIM API --------------------------------------------------------
vim.keymap.set("n", "<c-,>", ":source $MYVIMRC<cr>")
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
vim.opt.rtp:prepend(lazypath)
--- ALL PLUGINS -------------------------------------------------------
require("lazy").setup({
	--- defaults
	"nvim-lua/plenary.nvim",
	{ "mateuszwieloch/automkdir.nvim", event = "VeryLazy" },
	"Shatur/neovim-session-manager",
	{ "okuuva/auto-save.nvim", event = { "InsertLeave", "TextChanged" } },
	--- ui
	"akinsho/bufferline.nvim",
	{ "sainnhe/gruvbox-material", priority = 100 },
	"nvim-tree/nvim-web-devicons",
	{ "echasnovski/mini.indentscope", event = "VeryLazy", version = "*" },
	--- modeline
	{ "nvim-lualine/lualine.nvim", version = "*" },
	--- completion
	{
		"hrsh7th/nvim-cmp",
		version = "*",
		event = "VeryLazy",
		dependencies = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "onsails/lspkind.nvim" },
	},
	{ "FelipeLema/cmp-async-path", url = "https://codeberg.org/FelipeLema/cmp-async-path.git" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" },
		version = "*",
		event = "VeryLazy",
	},
	"windwp/nvim-autopairs",
	{ "tzachar/cmp-tabnine", build = "./install.sh" },
	--- looker
	{ "nvim-telescope/telescope.nvim", event = "VeryLazy", version = "*" },
	{ "debugloop/telescope-undo.nvim", version = "*" },
	{ "smartpde/telescope-recent-files", version = "*" },
	{ "2kabhishek/nerdy.nvim", dependencies = { "stevearc/dressing.nvim" }, cmd = "Nerdy" },
	{ "renerocksai/telekasten.nvim", version = "*" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", version = "*" },
	--- lsp
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{ "neovim/nvim-lspconfig", dependencies = { "hrsh7th/cmp-nvim-lsp" }, version = "*" },
	{ "ray-x/lsp_signature.nvim", version = "*", event = "VeryLazy" },
	{ "LukasPietzschmann/boo.nvim", version = "*" },
	{ "stevearc/conform.nvim", version = "*" },
	{ "luckasRanarison/nvim-devdocs", version = "*", event = "VeryLazy" },
	{ "folke/trouble.nvim", version = "*" },
	{ "dnlhc/glance.nvim", version = "*" },
	{ "zeioth/garbage-day.nvim", event = "VeryLazy", version = "*" },
	--- languages
	{ "nvim-treesitter/nvim-treesitter", version = "*" },
	{ "kaarmu/typst.vim", ft = "typst" },
	{ "michaelb/sniprun", build = "./install.sh", version = "*" },
	"pappasam/nvim-repl",
	--- applications
	{ "NeogitOrg/neogit", dependencies = { "sindrets/diffview.nvim" }, version = "*" },
	{ "codota/tabnine-nvim", build = "./dl_binaries.sh", version = "*" },
	{ "akinsho/toggleterm.nvim", event = "VeryLazy", version = "*" },
	{ "is0n/fm-nvim", cmd = "Lf" },
	{ "HakonHarnes/img-clip.nvim", event = "VeryLazy", keys = { { "<leader>p", "<cmd>PasteImage<cr>" } } },
	--- editing
	{ "phaazon/hop.nvim", version = false },
	{ "filipdutescu/renamer.nvim", event = "VeryLazy" },
	{ "echasnovski/mini.nvim", version = false },
	{ "MagicDuck/grug-far.nvim", cmd = "GrugFar" },
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
--- Modules -------------------------------------------------------
load("defaults")
load("ui")
load("modeline")
load("completion")
load("looker")
load("lsp")
load("languages")
load("applications")
load("editing")
----------------------------------------------------------
vim.loader.enable()
--- DIAGNOSTICS AT GUTTER
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

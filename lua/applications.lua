---- FILE MANAGER -------------------------------------------------------
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
			height = 0.9,
			width = 0.9,
			x = 0.5,
			y = 0.5,
		},
		split = {
			direction = "topright",
			size = 24,
		},
	},
	mappings = {
		vert_split = "<C-h>",
		horz_split = "<C-s>",
		tabedit = "<C-t>",
		edit = "<C-e>",
		ESC = "<ESC>",
	},
	broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson",
})
vim.keymap.set("n", "<leader>ff", ":Lf<CR>")
---- TERMINAL -------------------------------------------------------
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
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.keymap.set({ "t", "n" }, "<C-v>", "<cmd>ToggleTerm<CR>", { buffer = true, silent = true })
		vim.opt_local.cursorline = nocursorline
	end,
})
vim.keymap.set("n", "<leader>v", "<cmd>ToggleTerm<CR>", { remap = true }) --- toggle outside terminal
vim.keymap.set("t", "<C-v>", "<cmd>ToggleTerm<CR>") --- toggle inside terminal
---- TABNINE  -------------------------------------------------------
require("tabnine").setup({
	disable_auto_comment = true,
	accept_keymap = "<C-f>",
	dismiss_keymap = "<C-]>",
	debounce_ms = 800,
	suggestion_color = { gui = "#808080", cterm = 244 },
	exclude_filetypes = { "TelescopePrompt", "NvimTree" },
	log_file_path = nil,
})
---- NEOGIT -------------------------------------------------------
require("neogit").setup({
	mappings = {
		popup = {
			["p"] = "PushPopup",
			["P"] = "PullPopup",
		},
	},
})
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit cwd=%:p:h<cr>")
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit cwd=~/.dotfiles/<cr>")
---- CODE SCREENSHOT -------------------------------------------------------
require("rayso").setup({
	open_cmd = "org.mozilla.firefox",
	options = {
		background = false, --- If the screenshot should have a background.
		padding = 16, --- The default padding that the screenshot will have.
		theme = "sunset", --- Theme
		title = "Untitled", --- Default title
	},
})
vim.keymap.set("v", "<leader>l", require("lib.create").create_snippet)
---- DISCORD ----
require("presence").setup({
	auto_update = true,
	neovim_image_text = "The One True Text Editor",
	main_image = "neovim",
	client_id = "793271441293967371",
	debounce_timeout = 10,
	enable_line_number = false,
	blacklist = {},
	buttons = true,
	file_assets = {},
	show_time = false,
	editing_text = "Editing %s",
	file_explorer_text = "Browsing %s",
	git_commit_text = "Committing changes",
	plugin_manager_text = "Managing plugins",
	reading_text = "Reading %s",
	workspace_text = "Working on %s",
	line_number_text = "Line %s out of %s",
})

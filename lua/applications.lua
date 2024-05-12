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
Keymap("n", "<leader>ff", ":Lf<CR>")
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
Autocmd("TermOpen", {
	pattern = "*",
	command = "setlocal cursorline nocursorline",
})
Keymap("n", "<leader>v", "<cmd>ToggleTerm<CR>", { remap = true }) -- toggle outside terminal
Keymap("t", "<C-v>", "<cmd>ToggleTerm<CR>") -- toggle inside terminal
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
--- NEOGIT -------------------------------------------------------
require("neogit").setup({
	mappings = {
		popup = {
			["p"] = "PushPopup",
			["P"] = "PullPopup",
		},
	},
})
Keymap("n", "<leader>g", "<cmd>Neogit<cr>")

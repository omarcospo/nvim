--- THEMING --------------------------------------------------------
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_foreground = "original"
vim.cmd.colorscheme("gruvbox-material")
--- BUFFERLINE -------------------------------------------------------
require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		color_icons = false,
		separator_style = "slope",
		always_show_bufferline = true,
		auto_toggle_bufferline = true,
		show_buffer_close_icons = true,
	},
})
--- INDENTATION -------------------------------------------------------
require("mini.indentscope").setup({
	draw = {
		delay = 30,
		priority = 2,
	},
	symbol = "│",
})
--- HIGHLIGHT COLORS AND TODOS -------------------------------------------------------
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = { hex_color = hipatterns.gen_highlighter.hex_color() },
})

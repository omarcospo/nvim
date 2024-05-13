--- THEMING --------------------------------------------------------
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_better_performance = 1
vim.cmd.colorscheme("gruvbox-material")
require("bufferline").setup()
--- INDENTATION -------------------------------------------------------
require("mini.indentscope").setup({
	draw = {
		delay = 30,
		priority = 2,
	},
	symbol = "│",
})

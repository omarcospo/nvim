--- THEMING --------------------------------------------------------
Cmd([[hi Normal guibg=NONE ctermbg=NONE]])
Set.gruvbox_material_background = "medium"
Set.gruvbox_material_foreground = "original"
Set.gruvbox_material_better_performance = 1
Cmd.colorscheme("gruvbox-material")
require("bufferline").setup()
--- INDENTATION -------------------------------------------------------
require("mini.indentscope").setup({
	draw = {
		delay = 30,
		priority = 2,
	},
	symbol = "│",
})

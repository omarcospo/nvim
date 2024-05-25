---- THEMING --------------------------------------------------------
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_current_word = "italic"
vim.cmd.colorscheme("gruvbox-material")
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
---- BUFFERLINE -------------------------------------------------------
require("mini.tabline").setup()
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "▎", change = "▎", delete = "▎" },
	},
})
vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = "#83A598" })
vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#FABD2F" })
vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#FB4934" })
---- INDENTATION -------------------------------------------------------
require("mini.indentscope").setup({
	draw = {
		delay = 30,
		priority = 2,
	},
	symbol = "▕",
})
---- HIGHLIGHT COLORS AND TODOS -------------------------------------------------------
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = { hex_color = hipatterns.gen_highlighter.hex_color() },
})

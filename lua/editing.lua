--- EDITING --------------------------------------------------------
require("mini.pairs").setup() -- autopairs
require("mini.cursorword").setup() -- highlight ocurrences of current word at point
require("mini.surround").setup() -- surround object with thingy
require("mini.ai").setup({ n_lines = 500 })
require("mini.comment").setup({
	options = {
		ignore_blank_line = true,
		pad_comment_parts = true,
	},
})
require("renamer").setup()
-- stylua: ignore
vim.keymap.set("n", "gr", function() require("renamer").rename() end, { remap = true })
require("hop").setup()
-- stylua: ignore
vim.keymap.set("", "f", function() require("hop").hint_char1({ current_line_only = false }) end, { remap = true })
-- stylua: ignore
vim.keymap.set("", "t", function() require("hop").hint_char1({ current_line_only = true }) end, { remap = true })
--- REPLACE --------------------------------------------------------
require("grug-far").setup({
	keymaps = {
		-- normal and insert mode
		replace = "<C-enter>",
		qflist = "",
		syncLocations = "<C-s>",
		close = "<C-x>",
		-- normal mode only
		gotoLocation = "<enter>",
	},
})
vim.keymap.set("n", "<leader><C-r>", ":GrugFar<CR>", { remap = true })

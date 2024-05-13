--- EDITING --------------------------------------------------------
require("mini.pairs").setup() -- autopairs
require("Comment").setup()
require("mini.cursorword").setup() -- highlight ocurrences of current word at point
require("mini.surround").setup() -- surround object with thingy
require("mini.ai").setup({ n_lines = 500 })
require("renamer").setup()
-- stylua: ignore
vim.keymap.set("n", "gr", function() require("renamer").rename() end, { remap = true })
require("hop").setup() -- surround object with thingy
-- stylua: ignore
vim.keymap.set("", "f", function() require("hop").hint_char1({ current_line_only = false }) end, { remap = true })
-- stylua: ignore
vim.keymap.set("", "t", function() require("hop").hint_char1({ current_line_only = true }) end, { remap = true })

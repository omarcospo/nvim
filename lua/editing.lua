---- EDITING --------------------------------------------------------
require("mini.pairs").setup({
  mappings = {
    ["<"] = { action = "open", pair = "<>", neigh_pattern = "\r.", register = { cr = false } },
    [">"] = { action = "close", pair = "<>", register = { cr = false } },
  },
}) --- autopairs
require("mini.cursorword").setup() --- highlight ocurrences of current word at point
require("mini.surround").setup() --- surround object with thingy
require("hop").setup()
vim.keymap.set("", "f", function()
  require("hop").hint_char1({ current_line_only = false })
end, { remap = true })
---- REPLACE --------------------------------------------------------
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
---- FOLDING --------------------------------------------------------
require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})
vim.o.foldcolumn = "0" --- '0' is not bad
vim.o.foldlevel = 99 --- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
--- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "<TAB>", "za")
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

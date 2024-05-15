--- MASON -------------------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })
--- LSP BASE -------------------------------------------------------
lsp = require("lspconfig")
require("garbage-day").setup({}) -- stop unused LSP
--- INLAY  -------------------------------------------------------
require("lsp_signature").setup({})
require("lsp_signature").on_attach({}, bufnr)
--- DOCUMENTATION POPUP -------------------------------------------------------
require("boo").setup()
vim.keymap.set("n", "gd", [[<cmd>lua require('boo').boo()<CR>]], { noremap = true, silent = true })
--- REFERENCES/DEFINITION POPUP -------------------------------------------------------
require("glance").setup()
vim.keymap.set("n", "gf", ":Glance references<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gh", ":Glance definitions<CR>", { noremap = true, silent = true })
--- DEVDOCS -------------------------------------------------------
require("nvim-devdocs").setup({
	after_open = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-q>", ":close<CR>", {})
	end,
})
vim.keymap.set("n", "<leader>d", ":DevdocsOpenCurrentFloat<CR>")
--- DIAGNOSTICS LIST -------------------------------------------------------
require("trouble").setup({
	position = "left", -- position of the list can be: bottom, top, left, right
	indent_lines = false,
	padding = false,
	width = 70,
})
vim.keymap.set("n", "<leader>n", ":TroubleToggle<cr>")
--- DIAGNOSTICS IN GUTTER WITH CUSTOM ICONS -------------------------------------------------------
local signs = {
	{ name = "DiagnosticSignError", text = "󰈜" },
	{ name = "DiagnosticSignWarn", text = "󰀧" },
	{ name = "DiagnosticSignHint", text = "󰞋" },
	{ name = "DiagnosticSignInfo", text = "󰞋" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	signs = { active = signs },
})

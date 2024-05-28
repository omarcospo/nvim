return {
	"neovim/nvim-lspconfig",
	dependencies = { "LukasPietzschmann/boo.nvim", "dnlhc/glance.nvim" },
	event = "BufReadPost",
	keys = {
		{ "<leader>c", vim.lsp.buf.code_action, desc = "Code Action" },
		{ "gd", [[<cmd>lua require('boo').boo()<CR>]], desc = "Go to definition" },
		{ "gf", ":Glance references<CR>" },
		{ "gh", ":Glance definitions<CR>" },
	},
	config = function()
		lsp = require("lspconfig")
		require("boo").setup()
		require("glance").setup()
		--- Python
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "python",
			callback = function()
				vim.opt_local.expandtab = true
				vim.opt_local.shiftwidth = 4
				vim.opt_local.tabstop = 4
				vim.opt_local.softtabstop = 4
				vim.opt_local.foldmethod = "indent"
			end,
		})
		vim.g.python3_host_prog = vim.fn.expand("~/.local/python/bin/python")
		lsp.jedi_language_server.setup({
			init_options = {
				workspace = { environmentPath = vim.g.python3_host_prog },
			},
		})
	end,
}

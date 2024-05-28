return {
	"stevearc/conform.nvim",
	event = { "BufWritePost" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
        lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 200,
				lsp_fallback = false,
			},
			notify_on_error = true,
		})
	end,
}

--- TREESITTER -------------------------------------------------------
require("nvim-treesitter.configs").setup({
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		disable = { "html" },
		additional_vim_regex_highlighting = false,
	},
})
--- FORMATTER -------------------------------------------------------
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format", "ruff" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		css = { "prettier" },
		go = { "gofmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	notify_on_error = false,
})
--- PYTHON -------------------------------------------------------
lsp.ruff_lsp.setup({})
lsp.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				ruff = { enabled = true },
				pycodestyle = { enabled = false },
				pyflakes = { enabled = false },
				mccabe = { enabled = false },
				flake8 = { enabled = false },
				mypy = { enabled = false },
			},
		},
		format = {
			formatting_options = nil,
			timeout_ms = nil,
		},
	},
})
--- PYTHON REPL -------------------------------------------------------
vim.g["repl_filetype_commands"] = {
	python = "~/.local/python/bin/ipython --no-autoindent",
}
vim.keymap.set("n", "<leader>rr", ":ReplToggle<CR>")
vim.keymap.set("n", "<leader>rl", ":ReplClear<CR>")
vim.keymap.set("n", "<leader>rc", ":ReplRunCell<CR>")
vim.keymap.set("v", "<leader>rr", "<Plug>ReplSendVisual")
------- TYPST ----------------------------------------------------
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.typ",
	command = "set filetype=typst",
})
lsp.typst_lsp.setup({
	settings = {
		exportPdf = "onType", -- Choose onType, onSave or never.
		format = {
			formatting_options = nil,
			timeout_ms = nil,
		},
	},
})
------- TYPESCRIPT ----------------------------------------------------
require("typescript-tools").setup({
	settings = {
		tsserver_file_preferences = {
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayVariableTypeHintsWhenTypeMatchesName = false,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
	},
})
require("nvim-ts-autotag").setup()

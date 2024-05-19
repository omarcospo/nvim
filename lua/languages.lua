--- TREESITTER -------------------------------------------------------
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "html", "markdown", "python", "bash", "json", "vim", "markdown_inline", "regex" },
	sync_install = true,
	auto_install = true,
	indent = { enable = true },
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
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
require("typescript-tools").setup({})
require("nvim-ts-autotag").setup()

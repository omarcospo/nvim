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
------- TYPST ----------------------------------------------------
Autocmd("BufWinEnter", {
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
------- LUA ----------------------------------------------------
lsp.lua_ls.setup({
	settings = {
		format = {
			formatting_options = nil,
			timeout_ms = nil,
		},
	},
})

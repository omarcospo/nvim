local telescope = require("telescope")
--- TELESCOPE -------------------------------------------------------
telescope.setup({
	defaults = {
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		mappings = {
			i = {
				["<C-q>"] = "close",
				["<C-f>"] = "select_default",
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
		},
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_mru = true,
			mappings = {
				i = {
					["<C-d>"] = "delete_buffer",
				},
			},
		},
	},
})
telescope.load_extension("recent_files")
--- FZF NATIVE -------------------------------------------------------
telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
telescope.load_extension("fzf")
--- UNDO -------------------------------------------------------
telescope.load_extension("undo")
telescope.setup({
	extensions = {
		undo = {
			mappings = {
				i = {
					["<cr>"] = require("telescope-undo.actions").yank_additions,
					["<C-y>"] = require("telescope-undo.actions").yank_deletions,
					["<C-r>"] = require("telescope-undo.actions").restore,
				},
			},
		},
	},
})
--- NOTE TAKING -------------------------------------------------------
require("telekasten").setup({ home = vim.fn.expand("~/Notes") })
--- KEYMAPS -------------------------------------------------------
Keymap("n", "<leader>u", "<cmd>Telescope undo<cr>")
Keymap("n", "<leader>o", "<cmd>Telekasten find_notes<cr>")
Keymap(
	"n",
	"<leader>fr",
	[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
	{ noremap = true, silent = true }
)
Keymap("n", "<leader>bb", "<cmd>Telescope buffers<CR>")
-- Search
Keymap("n", "<leader>s", ":Telescope live_grep<CR>")
Keymap("n", "<leader>fl", ":Telescope live_grep search_dirs=. '~/'<CR>")

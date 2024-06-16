return {
  "nvim-telescope/telescope.nvim",
  event = "UIEnter",
  dependencies = {
    { "debugloop/telescope-undo.nvim", cmd = "Telescope undo" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-frecency.nvim" },
  },
  config = function()
    local telescope = require("telescope")
    ---- TELESCOPE -------------------------------------------------------
    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.65,
            results_width = 0.8,
          },
          vertical = {
            mirror = true,
            prompt_position = "top",
            preview_height = 0.60,
            preview_cutoff = 0,
          },
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
        colorscheme = {
          enable_preview = true,
        },
      },
    })
    ---- RECENT FILES -------------------------------------------------------
    telescope.setup({
      extensions = {
        frecency = {
          show_scores = false,
          show_unindexed = false,
          ignore_patterns = { "*.git/*", "*/tmp/*", "term:*" },
          disable_devicons = false,
          workspaces = {
            ["conf"] = "~/.config",
          },
        },
      },
    })
    ---- FZF NATIVE -------------------------------------------------------
    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true, --- false will only do exact matching
          override_generic_sorter = true, --- override the generic sorter
          override_file_sorter = true, --- override the file sorter
          case_mode = "smart_case", --- or "ignore_case" or "respect_case"
        },
      },
    })
    telescope.load_extension("fzf")
    ---- UNDO -------------------------------------------------------
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
    ---- KEYMAPS -------------------------------------------------------
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>")
    vim.keymap.set("n", "<leader>fr", ":Telescope frecency<CR>")
    vim.keymap.set("n", "<leader>fd", ":Telescope fd<CR>")
    vim.keymap.set("n", "<leader>s", ":Telescope live_grep<CR>")
    vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>")
    vim.keymap.set("n", "<leader>a", ":Telescope current_buffer_fuzzy_find<CR>")
    vim.keymap.set("n", "<leader>gh", ":Telescope git_commits<CR>")
  end,
}

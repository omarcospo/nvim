return {
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGitCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      vim.g.lazygit_floating_window_use_plenary = 0
    end,
    keys = {
      { "<leader>gg", ":LazyGitCurrentFile<CR>" },
      { "<leader>gb", "<cmd>Telescope git_bcommits<cr>" },
      { "<leader>gl", "<cmd>Telescope git_commits<cr>" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>" },
    },
  },
  {
    "echasnovski/mini.diff",
    opts = {
      view = { style = "number" },
      mappings = {
        apply = "gh", -- Apply hunks
        reset = "gH", -- Reset hunks
      },
    },
  },
}

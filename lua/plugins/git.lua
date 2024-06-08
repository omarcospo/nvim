return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  keys = {
    -- { "<leader>gg", "<cmd>Neogit cwd=%:p:h<cr>" },
    -- { "<leader>gc", "<cmd>Neogit cwd=~/.dotfiles/<cr>" },
    { "<leader>gb", "<cmd>Telescope git_bcommits<cr>" },
    { "<leader>gl", "<cmd>Telescope git_commits<cr>" },
    { "<leader>gf", "<cmd>Telescope git_files<cr>" },
  },
  config = function()
    require("neogit").setup({
      mappings = {
        popup = {
          ["p"] = "PushPopup",
          ["P"] = "PullPopup",
        },
      },
    })
  end,
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGitCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      vim.g.lazygit_floating_window_use_plenary = 0
    end,
    keys = {
      { "<leader>gg", ":LazyGitCurrentFile<CR>" },
    },
  },
}

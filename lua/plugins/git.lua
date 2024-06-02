return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit cwd=%:p:h<cr>" },
    { "<leader>gc", "<cmd>Neogit cwd=~/.dotfiles/<cr>" },
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
}

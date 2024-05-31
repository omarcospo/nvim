return {
  "folke/trouble.nvim",
  cmd = "Trouble diagnostics toggle",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  },
  opts = {
    auto_close = true,
  }, -- for default options, refer to the configuration section for custom setup.
}

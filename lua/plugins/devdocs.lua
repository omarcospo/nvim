return {
  "luckasRanarison/nvim-devdocs",
  cmd = "DevdocsOpen",
  keys = { "<leader>dd", ":DevdocsOpen<CR>" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
}

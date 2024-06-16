return {
  "luckasRanarison/nvim-devdocs",
  cmd = "DevdocsOpenCurrent",
  ft = { "lua", "go", "typescript" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
  config = function()
    require("nvim-devdocs").setup({
      after_open = function(bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-q>", ":close<CR>", {})
      end,
    })
    vim.keymap.set("n", "<leader>dd", ":DevdocsOpenCurrent<CR>")
  end,
}

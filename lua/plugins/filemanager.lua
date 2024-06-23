return {
  {
    "lmburns/lf.nvim",
    dependencies = { "toggleterm.nvim" },
    config = function()
      require("lf").setup({
        border = "rounded",
        winblend = 0,
        height = vim.fn.float2nr(vim.fn.round(1.40 * vim.o.lines)),
        width = vim.fn.float2nr(vim.fn.round(2.25 * vim.o.columns)),
        default_file_manager = true,
      })
      vim.g.lf_netrw = 1
      vim.api.nvim_create_autocmd({ "User" }, {
        pattern = "LfTermEnter",
        callback = function(a)
          local sendEsc = "<C-\\><C-n>i<Esc>"
          vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", { nowait = true })
          vim.api.nvim_buf_set_keymap(a.buf, "t", "<Esc>", sendEsc, { noremap = true })
          vim.api.nvim_buf_set_keymap(a.buf, "t", "<C-q>", sendEsc, { nowait = true })
          vim.api.nvim_buf_set_keymap(a.buf, "t", "<C-c>", sendEsc, { nowait = true })
        end,
      })
      vim.keymap.set("n", "<leader>ff", ":Lf<CR>")
    end,
  },
  {
    "VebbNix/lf-vim",
  },
}

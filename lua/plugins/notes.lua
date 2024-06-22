return {
  dir = vim.fn.expand("~/.config/nvim/lua/plugins/custom/dumbnotes"),
  cmd = { "DumbNotes", "DumbNotesGrep" },
  keys = { { "<leader>of", ":DumbNotes<CR>" }, { "<leader>os", ":DumbNotesGrep<CR>" } },
  config = function()
    require("dumbnotes").setup({
      find_recursively = true,
    })
  end,
}

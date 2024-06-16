return {
  "zk-org/zk-nvim",
  cmd = { "ZkNotes", "ZkNew", "ZkNewFromTitleSelection" },
  init = function()
    vim.keymap.set("n", "<leader>of", "<CMD>ZkNotes<CR>")
    vim.keymap.set("n", "<leader>on", "<CMD>ZkNew<CR>")
    vim.keymap.set("v", "<leader>on", ":'<,'>ZkNewFromTitleSelection<CR>")
  end,
  config = function()
    require("zk").setup()
  end,
}

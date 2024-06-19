return {
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      DONE = { icon = "", color = "test" },
      TODO = { icon = " " },
      WARN = { icon = "", color = "warning" },
      NOTE = { icon = "" },
      FIX = { icon = "" },
    },
  },
}

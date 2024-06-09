return {
  "michaelb/sniprun",
  build = "sh install.sh",
  cmd = "SnipRun",
  init = function()
    vim.keymap.set("v", "<CR>", ":'<,'>SnipRun<CR>")
  end,
  opts = {
    display = { "TempFloatingWindow" },
  },
}

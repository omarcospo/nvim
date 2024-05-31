return {
  "HiPhish/rainbow-delimiters.nvim",
  url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
  event = "BufReadPost",
  config = function()
    require("rainbow-delimiters.setup").setup()
  end,
}

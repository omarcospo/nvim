return {
  "HiPhish/rainbow-delimiters.nvim",
  url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
  event = "BufReadPost",
  dependencies = { "monkoose/matchparen.nvim" },
  config = function()
    require("matchparen").setup()
    require("rainbow-delimiters.setup").setup()
  end,
}

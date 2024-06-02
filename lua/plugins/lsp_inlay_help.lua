return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    hi_parameter = "IncSearch", -- Color to highlight floating window.
    handler_opts = { border = "rounded" }, -- Window style
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}

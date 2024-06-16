return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    hi_parameter = "IncSearch", -- Color to highlight floating window.
    handler_opts = { border = "rounded" }, -- Window style
    floating_window = true, -- Display it as floating window.
    hint_enable = false, -- Display it as hint.
    hint_prefix = "👈 ",
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}

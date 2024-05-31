return {
  "luckasRanarison/clear-action.nvim",
  event = "LspAttach",
  opts = {
    signs = {
      icons = {
        quickfix = "󰒓 ",
        refactor = " ",
        source = " ",
        combined = " ",
      },
    },
    popup = {
      enable = true,
      border = "rounded",
      hide_cursor = true,
      hide_client = true,
    },
    mappings = {
      code_action = "ga",
      apply_first = "gf",
      quickfix = "gq",
    },
  },
}

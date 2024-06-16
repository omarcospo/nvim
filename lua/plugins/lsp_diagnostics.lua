return {
  "folke/trouble.nvim",
  cmd = "Trouble diagnostics toggle",
  keys = {
    { "gt", "<CMD>Trouble diagnostics toggle filter.buf=0 focus=true<CR>" },
    { "gs", "<CMD>Trouble lsp_references focus=true<CR>" },
  },
  opts = {
    auto_close = true,
  }, -- for default options, refer to the configuration section for custom setup.
  init = function()
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
    })
  end,
}

return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    { "gt", "<CMD>Trouble diagnostics toggle filter.buf=0 focus=true<CR>" },
    { "gs", "<CMD>Trouble lsp_references toggle focus=true<CR>" },
    { "<leader>ts", "<CMD>Trouble lsp_document_symbols toggle focus=false win.position=left filter.buf=0<CR>" },
  },
  opts = {
    auto_close = true,
    auto_preview = true,
    auto_refresh = true,
    auto_jump = true,
    focus = true,
    restore = true,
    follow = true,
    indent_guides = false,
    max_items = 200,
    multiline = false,
    warn_no_results = false,
    open_no_results = false,
    icons = {
      indent = { middle = "", last = "", top = "", ws = "" },
    },
  },
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

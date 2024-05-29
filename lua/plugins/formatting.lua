return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      lua = { "stylua" },
      go = { "gofmt" },
    },
    format_on_save = { timeout_ms = 200, lsp_fallback = true },
    notify_on_error = false,
  },
}

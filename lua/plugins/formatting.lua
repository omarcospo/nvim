return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters = {
      gofumpt = {
        command = "gofumpt",
        args = { "$FILENAME" },
        stdin = false,
      },
    },
    formatters_by_ft = {
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      lua = { "stylua" },
      go = { "gofumpt", "goimports", "goimports-reviser" },
      markdown = { "mdformat" },
      typst = { "typstyle" },
      zsh = { "shellcheck" },
    },
    format_on_save = { timeout_ms = 200, lsp_fallback = true },
    notify_on_error = false,
  },
  init = function()
    require("conform").formatters.typstyle = {
      inherit = false,
      command = "typstyle",
      args = { "$FILENAME" },
    }
  end,
}

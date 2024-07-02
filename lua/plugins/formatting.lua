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
      typescript = { "biome" },
      javascript = { "biome" },
      json = { "biome" },
      css = { "biome" },
      lua = { "stylua" },
      go = { "gofumpt", "goimports", "goimports-reviser" },
      markdown = { "mdformat" },
      sh = { "shellcheck" },
      nix = { "alejandra" },
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

return {
  "nvim-treesitter/nvim-treesitter",
  events = "UIEnter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  opts = {
    auto_install = false,
    highlight = {
      enable = true,
      disable = function(_, bufnr)
        local excluded_filetypes = {} -- disabled for bugged parsers
        local is_disabled = vim.tbl_contains(excluded_filetypes, vim.bo.filetype) or utils.is_big_file(bufnr)
        return is_disabled
      end,
    },
    matchup = {
      enable = true,
      enable_quotes = true,
      disable = function(_, bufnr)
        local excluded_filetypes = { "c" } -- disabled for slow parsers
        local is_disabled = vim.tbl_contains(excluded_filetypes, vim.bo.filetype) or utils.is_big_file(bufnr)
        return is_disabled
      end,
    },
    incremental_selection = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "typst",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "go",
      "typst",
    },
  },
}

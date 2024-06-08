return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "LukasPietzschmann/boo.nvim",
    "pmizio/typescript-tools.nvim",
    "nvim-lua/plenary.nvim",
    "MysticalDevil/inlay-hints.nvim",
    {
      "zeioth/garbage-day.nvim",
      event = "User BaseFile",
      opts = {
        aggressive_mode = false,
        grace_period = (60 * 15),
        wakeup_delay = 3000,
        notifications = false,
        retries = 3,
        timeout = 1000,
      },
    },
  },
  ft = { "python", "go", "typescript", "lua" },
  keys = {
    { "gd", [[<cmd>lua require('boo').boo()<CR>]] },
    { "gr", "<cmd>lua vim.lsp.buf.rename()<CR>" },
  },
  config = function()
    local lsp = require("lspconfig")
    require("boo").setup()
    require("inlay-hints").setup()
    --- Python
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.foldmethod = "indent"
      end,
    })
    lsp.jedi_language_server.setup({
      init_options = {
        workspace = { environmentPath = vim.g.python3_host_prog },
      },
    })
    --- GO
    lsp.gopls.setup({
      settings = {
        gopls = {
          gofumpt = true,
        },
        hints = {
          rangeVariableTypes = true,
          parameterNames = true,
          constantValues = true,
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          functionTypeParameters = true,
        },
      },
    })
    --- TypeScript
    require("typescript-tools").setup({
      settings = {
        complete_function_calls = false,
        include_completions_with_insert_text = false,
        code_lens = "off",
        disable_member_code_lens = false,
        jsx_close_tag = { enable = false },
        --- Inlay Hints
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    })
    --- Typst
    lsp.typst_lsp.setup({
      settings = {
        exportPdf = "onType",
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
      },
    })
    --- LUA
    lsp.lua_ls.setup({})
  end,
}

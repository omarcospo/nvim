return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "LukasPietzschmann/boo.nvim",
    { "pmizio/typescript-tools.nvim", ft = { "typescript" } },
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
  init = function()
    local lsp = vim.lsp
    lsp.handlers["$/progress"] = function() end
    lsp.handlers["window/logMessage"] = function() end
    lsp.handlers["window/showMessage"] = function() end
  end,
  config = function()
    local lsp = require("lspconfig")
    require("boo").setup()
    require("inlay-hints").setup()
    vim.keymap.set("n", "<leader>lh", ":InlayHintsToggle<CR>")
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
    --- GO
    lsp.gopls.setup({
      settings = {
        gopls = {
          gofumpt = true,
          usePlaceholders = true,
          analyses = {
            fieldalignment = false, -- find structs that would use less memory if their fields were sorted
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            rangeVariableTypes = true,
            parameterNames = false,
            constantValues = true,
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            functionTypeParameters = true,
          },
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

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "LukasPietzschmann/boo.nvim",
    "pmizio/typescript-tools.nvim",
    "nvim-lua/plenary.nvim",
  },
  ft = { "python", "go", "typescript" },
  keys = {
    { "<leader>c", vim.lsp.buf.code_action, desc = "Code Action" },
    { "gd", [[<cmd>lua require('boo').boo()<CR>]], desc = "Go to definition" },
  },
  config = function()
    lsp = require("lspconfig")
    require("boo").setup()
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
    vim.g.python3_host_prog = vim.fn.expand("~/.local/python/bin/python")
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
      },
    })
  end,
}

return {
  {
    "echasnovski/mini.diff",
    opts = {
      view = { style = "number" },
      mappings = {
        apply = "gh", -- Apply hunks
        reset = "gH", -- Reset hunks
      },
    },
  },
  {
    "NeogitOrg/neogit",
    keys = {
      { "<leader>gg", ":Neogit<CR>" },
      { "<leader>gb", "<cmd>Telescope git_bcommits<cr>" },
      { "<leader>gl", "<cmd>Telescope git_commits<cr>" },
      { "<leader>fg", "<cmd>Telescope git_files<cr>" },
    },
    config = function()
      require("neogit").setup({
        disable_hint = true,
        disable_context_highlighting = true,
        auto_refresh = true,
        kind = "vsplit",
        auto_show_console = false,
        auto_close_console = true,
        commit_editor = {
          kind = "vsplit",
          show_staged_diff = true,
          staged_diff_split_kind = "auto",
        },
        signs = {
          hunk = { "", "" },
          item = { " ", " " },
          section = { " ", " " },
        },
        commit_select_view = { kind = "vsplit" },
        commit_view = { kind = "vsplit", verify_commit = false },
        log_view = { kind = "vsplit" },
        rebase_editor = { kind = "vsplit" },
        reflog_view = { kind = "vsplit" },
        merge_editor = { kind = "vsplit" },
        tag_editor = { kind = "vsplit" },
        preview_buffer = { kind = "split" },
        popup = { kind = "vsplit" },
      })
    end,
  },
}

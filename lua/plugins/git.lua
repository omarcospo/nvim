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
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    cmd = {
      "Gvdiffsplit",
      "Gdiffsplit",
      "Gedit",
      "Gsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GRename",
      "GDelete",
      "GRemove",
      "GBrowse",
      "Git",
      "Gstatus",
    },
    keys = {
      { "<leader>gg", ":Git<CR>" },
      { "<leader>gb", "<cmd>Telescope git_bcommits<cr>" },
      { "<leader>gl", "<cmd>Telescope git_commits<cr>" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>" },
    },
    config = function()
      vim.g.fugitive_no_maps = 1
    end,
  },
}

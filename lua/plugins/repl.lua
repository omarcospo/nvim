return {
  "luk400/vim-jukit",
  ft = { "python", "ipynb" },
  init = function()
    vim.g.jukit_mappings_ext_enabled = { "py", "ipynb" }
  end,
}

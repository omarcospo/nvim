return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = { library = { "luvit-meta/library" } },
  },
  { "Bilal2453/luvit-meta", lazy = true },
  { "rafcamlet/nvim-luapad" },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0,
      })
    end,
  },
}

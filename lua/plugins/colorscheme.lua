return {
  -- {
  --   "HoNamDuong/hybrid.nvim",
  --   version = false,
  --   priority = 101,
  --   event = "UIEnter",
  --   opts = {},
  --   config = function()
  --     require("hybrid").setup({
  --       overrides = function(hl, c)
  --         local background = "#1d1f21"
  --         hl.TelescopeNormal = {
  --           fg = c.fg,
  --           bg = background,
  --         }
  --         hl.TelescopeBorder = {
  --           fg = c.fg_hard,
  --           bg = c.bg,
  --         }
  --         hl.TelescopeTitle = {
  --           fg = c.fg_hard,
  --           bg = c.bg,
  --           bold = true,
  --         }
  --       end,
  --     })
  --     vim.cmd.colorscheme("hybrid")
  --     vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  --     if not vim.g.neovide then
  --       vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  --     end
  --     vim.api.nvim_set_hl(0, "StatusLine", { link = "Comment" })
  --     vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Comment" })
  --     vim.opt.statusline = '%{repeat("─",winwidth("."))}'
  --   end,
  -- },
  -- { "savq/melange-nvim" },
  {
    "omarcospo/oxocarbon.nvim",
    version = false,
    priority = 101,
    event = "UIEnter",
    config = function()
      vim.cmd.colorscheme("oxocarbon")
      if not vim.g.neovide then
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      end
    end,
  },
}

return {
  "HoNamDuong/hybrid.nvim",
  version = false,
  priority = 101,
  event = "UIEnter",
  opts = {},
  config = function()
    vim.cmd.colorscheme("hybrid")
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    if not vim.g.neovide then
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    end
    vim.api.nvim_set_hl(0, "StatusLine", { link = "Comment" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Comment" })
    vim.opt.statusline = '%{repeat("─",winwidth("."))}'
  end,
}

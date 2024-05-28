return {
  "sainnhe/gruvbox-material",
  version = false,
  priority = 101,
  event = "UIEnter",
  config = function()
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_background = "medium"
    vim.g.gruvbox_material_foreground = "original"
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_current_word = "italic"
    vim.cmd.colorscheme("gruvbox-material")
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#FABD2F" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    if not vim.g.neovide then
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    end
    vim.api.nvim_set_hl(0, "StatusLine", { link = "Comment" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Comment" })
    vim.opt.statusline = '%{repeat("─",winwidth("."))}'
  end,
}

return {
  "omarcospo/oxocarbon.nvim",
  version = false,
  priority = 101,
  event = "UIEnter",
  config = function()
    vim.cmd.colorscheme("oxocarbon")
    -- if not vim.g.neovide then
    --   vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    -- end
  end,
}

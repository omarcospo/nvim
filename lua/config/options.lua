--- Session
vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
--- Tabline
--- Status Line
--- Copy/Paste
vim.opt.clipboard = "unnamed,unnamedplus" --- copy/paste to system clipboard
--- Scrolling
vim.opt.lazyredraw = true --- faster scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
--- Highlighting
vim.opt.synmaxcol = 240 --- max column for syntax highlight Indentation - Width of a tab
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true --- spaces to tab
--- Gutter Signs
vim.opt.fillchars:append({ eob = " " }) --- hide "~" at blank lines
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
--- Line Numbers
vim.opt.number = true --- show line numbers Window vim.opt.splitbelow = true --- put new windows below current
vim.opt.splitright = true --- put new vertical splits to right
--- Undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")
--- Backups
vim.opt.backup = false --- this is recommended by coc
vim.opt.writebackup = false --- this is recommended by coc
--- CursosLine
vim.opt.cursorline = false
--- StatusLine
-- vim.opt.cmdheight = 0
--- Neovide
if vim.g.neovide then
  --- Fonts
  vim.opt.guifont = "IosevkaTerm_Nerd_Font:h15"
  vim.g.neovide_theme = "dark"
  --- Cursor and mouse
  vim.g.neovide_cursor_trail_size = 0.4
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_unlink_border_highlights = true
  --- Scroll
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_scroll_animation_far_lines = 5
  --- Window Padding
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  --- Floating
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_blur_amount_y = 0.0
  vim.g.neovide_floating_blur_amount_x = 0.0
  --- Keymaps
  --- Paste like terminal
  vim.keymap.set("n", "<sc-v>", 'l"+P', { noremap = true })
  vim.keymap.set("v", "<sc-v>", '"+P', { noremap = true })
  vim.keymap.set("c", "<sc-v>", '<C-o>l<C-o>"+<C-o>P<C-o>l', { noremap = true })
  vim.keymap.set("t", "<sc-v>", '<C-\\><C-n>"+Pi', { noremap = true })
  --- Scaling
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    vim.cmd("redraw!")
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.05)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.05)
  end)
end

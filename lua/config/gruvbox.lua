local colors = {
  bg = "#282828", -- background
  bg1 = "#3c3836", -- background dark
  bg2 = "#504945", -- background darker
  bg3 = "#665c54", -- background darkest
  fg0 = "#d4be98", -- foreground light
  fg1 = "#ddc7a1", -- foreground lighter
  red = "#ea6962", -- red
  orange = "#e78a4e", -- orange
  yellow = "#d8a657", -- yellow
  green = "#a9b665", -- green
  aqua = "#89b482", -- aqua/cyan
  blue = "#7daea3", -- blue
  purple = "#d3869b", -- purple
  bg_red = "#ea6962", -- background red
  bg_green = "#a9b665", -- background green
  bg_yellow = "#d8a657", -- background yellow
}

local function set_highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function apply_colors()
  vim.cmd("highlight clear")
  vim.cmd("syntax reset")
  vim.o.background = "dark"
  vim.o.termguicolors = true

  if not vim.g.neovide then
    set_highlight("Normal", { fg = colors.fg1, bg = "NONE" })
  else
    set_highlight("Normal", { fg = colors.fg1, bg = colors.bg })
  end
  -- Highlight for selected text
  set_highlight("Visual", { bg = colors.bg3, fg = "NONE" })
  --- Font styles
  set_highlight("Underlined", { underline = true, bg = "NONE", fg = "NONE" })
  set_highlight("Bold", { bold = true, bg = "NONE", fg = "NONE" })
  set_highlight("Italic", { italic = true, bg = "NONE", fg = "NONE" })
  --- Syntax
  ---- RED
  set_highlight("PreProc", { fg = colors.red })
  set_highlight("Conditional", { fg = colors.red })
  set_highlight("Keyword", { fg = colors.red })
  set_highlight("Define", { fg = colors.red })
  set_highlight("Macro", { fg = colors.red })
  set_highlight("PreCondit", { fg = colors.red })
  set_highlight("Include", { fg = colors.red })
  set_highlight("Error", { fg = colors.red, bg = "NONE" })
  ---- GREEN
  set_highlight("Identifier", { fg = colors.green })
  set_highlight("Function", { fg = colors.green })
  set_highlight("Exception", { fg = colors.green })
  set_highlight("Debug", { fg = colors.green })
  set_highlight("String", { fg = colors.green })
  ---- BLUE
  set_highlight("Statement", { fg = colors.blue })
  ---- ORANGE
  set_highlight("Constant", { fg = colors.orange })
  ---- YELLOW
  set_highlight("Type", { fg = colors.yellow })
  set_highlight("Repeat", { fg = colors.yellow })
  set_highlight("Number", { fg = colors.orange })
  set_highlight("Label", { fg = colors.yellow })
  set_highlight("TypeDef", { fg = colors.yellow })
  set_highlight("Tag", { fg = colors.yellow })
  set_highlight("Todo", { fg = colors.yellow, bg = colors.bg, bold = true })
  ---- Aqua/Cyan
  set_highlight("Special", { fg = colors.aqua })
  set_highlight("SpecialComment", { fg = colors.bg1 })
  set_highlight("Delimiter", { fg = colors.fg1 })
  set_highlight("Special", { fg = colors.aqua })
  set_highlight("SpecialChar", { fg = colors.aqua })
  ---- Comments
  set_highlight("Comment", { fg = colors.bg3, italic = true })
  ---- Strings
  --- StatusLine
  set_highlight("StatusLine", { bg = "NONE", fg = colors.bg3 })
  set_highlight("StatusLineNC", { bg = "NONE", fg = colors.bg3 })
  vim.opt.statusline = '%{repeat("─",winwidth("."))}'
  --- DIAGNOSTICS
  set_highlight("DiagnosticError", { fg = colors.red, bg = colors.bg1 })
  set_highlight("DiagnosticWarn", { fg = colors.yellow, bg = colors.bg1 })
  set_highlight("DiagnosticInfo", { fg = colors.red, bg = colors.bg1 })
  set_highlight("DiagnosticHint", { fg = colors.yellow, bg = colors.bg1 })
  --- CMP
  ---- Itens
  set_highlight("CmpItemAbbr", { fg = colors.fg0, bg = colors.bg0 })
  set_highlight("CmpItemAbbrDeprecated", { fg = colors.fg1, strikethrough = true })
  set_highlight("CmpItemAbbrMatch", { fg = colors.red, bold = true })
  set_highlight("CmpItemAbbrMatchFuzzy", { fg = colors.red, underline = true, bold = true })
  ---- Item Icon
  set_highlight("CmpItemKindText", { bg = "NONE", fg = colors.bg3 })
  set_highlight("CmpItemKindSnippet", { bg = "NONE", fg = colors.orange })
  set_highlight("CmpItemKindSnippet", { bg = "NONE", fg = colors.orange })
  ---- Item Type
  set_highlight("CmpItemMenu", { bg = "NONE", fg = colors.bg3 })
  ---- Float windows
  set_highlight("FloatBorder", { bg = "NONE", fg = colors.orange })
  set_highlight("NormalFloat", { bg = "NONE" })
  --- HOP
  set_highlight("HopNextKey", { fg = colors.red, bold = true })
  set_highlight("HopNextKey1", { fg = colors.orange, bold = true })
  set_highlight("HopNextKey2", { fg = colors.green })
  set_highlight("HopUnmatched", { fg = colors.bg3 })
  --- TELESCOPE
  set_highlight("TelescopeTitle", { bg = colors.fg0, fg = colors.bg })
  -- TelescopePromptNormal = { link = "TelescopeNormal" },
  --- TERMINAL COLORS
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_8 = colors.bg3
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.aqua
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg1
  vim.g.terminal_color_15 = colors.fg0
end
apply_colors()

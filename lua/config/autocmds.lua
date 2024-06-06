-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "CodeAction",
    "checkhealth",
    "help",
    "DressingInput",
    "NeogitStatus",
    "NeogitConsole",
    "NeogitPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    local options = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "q", "<cmd>close<cr>", options)
    vim.keymap.set({ "n", "i" }, "<C-q>", "<cmd>close<cr>", options)
  end,
})
-- Change to the directory of the current file before opening a terminal
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*/gruvbox.lua" },
  callback = function(event)
    vim.api.nvim_command("luafile ~/.config/nvim/lua/config/gruvbox.lua")
  end,
})
--- Autosave
local function save()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_call(buf, function()
    vim.cmd("silent! write")
  end)
end
-- Clear existing AutoSave group
vim.api.nvim_create_augroup("AutoSave", { clear = true })
-- Function to start the timer
local function start_autosave_timer()
  local timer = vim.loop.new_timer()
  timer:start(
    60000,
    60000,
    vim.schedule_wrap(function()
      save()
    end)
  )
end

-- Start the autosave timer on VimEnter event
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    start_autosave_timer()
  end,
  group = "AutoSave",
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

----
local layout_active = false
local function tree_layout()
  if layout_active then
    vim.cmd("only")
    layout_active = false
  else
    vim.cmd("only")
    local mainBuf = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(win, buf)
    vim.api.nvim_open_win(0, false, { split = "left", win = 0 })
    local mainWin = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(mainWin, mainBuf)
    vim.api.nvim_open_win(0, false, { split = "left", win = 0 })
    vim.api.nvim_win_set_buf(win, buf)
    vim.cmd("wincmd h")
    layout_active = true
  end
end
-- Map the function to a command for easy use
vim.api.nvim_create_user_command("ThreeSplitLayout", tree_layout, {})
vim.keymap.set("n", "<leader>te", "<CMD>ThreeSplitLayout<CR>")

function Test_input()
  vim.ui.input({ prompt = "😄 Calculator: " }, function(input)
    local calc = load("return " .. (input or ""))()
    if calc then
      vim.api.nvim_feedkeys(tostring(calc), "i", true)
    end
  end)
end

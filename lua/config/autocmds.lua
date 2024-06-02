-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "CodeAction",
    "checkhealth",
    "help",
    "DressingInput",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    vim.keymap.set({ "n", "i" }, "<C-q>", "<cmd>close<cr>", { buffer = event.buf, silent = true })
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

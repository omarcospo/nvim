local DumbFormat = "md"
local DumbPath = "~/Notes"
local new_note_key = "<C-n>"
local delete_note_key = "<C-d>"

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local selection = action_state.get_selected_entry()

local function open(input, ext)
  local path
  if ext == true then
    path = vim.fn.expand(DumbPath .. "/" .. input .. "." .. DumbFormat)
    vim.cmd("edit " .. vim.fn.fnameescape(path))
  else
    path = vim.fn.expand(DumbPath .. "/" .. input)
    if vim.fn.filereadable(path) == 1 then
      vim.cmd("edit " .. vim.fn.fnameescape(path))
    else
      print("Invalid note: " .. path)
    end
  end
end

local function open_note(prompt_bufnr)
  if selection == nil then
    print("No valid note selected.")
    return
  end
  actions.close(prompt_bufnr)
  open(selection[1])
end

local function delete_note(prompt_bufnr)
  local file_path = vim.fn.expand(DumbPath .. "/" .. selection[1])
  actions.close(prompt_bufnr)
  if vim.fn.filereadable(file_path) == 1 then
    local confirm = vim.fn.confirm("Delete note: " .. file_path .. "?", "&Yes\n&No")
    if confirm == 1 then
      local ok, err = os.remove(file_path)
      if not ok then
        print("Error deleting note: " .. err)
      else
        print("Deleted note: " .. file_path)
      end
    else
      print("Deletion cancelled.")
    end
  else
    print("Note not found: " .. file_path)
  end
end

local function new_note(prompt_bufnr)
  actions.close(prompt_bufnr)
  local ok, input = pcall(function()
    return vim.fn.input({ prompt = "Note title: " })
  end)
  if ok then
    if input and input ~= "" then
      open(input, true)
    end
  else
    print("Error creating note: " .. input)
  end
end

function DumbNotesList()
  require("telescope.builtin").find_files({
    prompt_title = "Notes",
    cwd = DumbPath,
    find_command = { "fd", "-d", "1", "--extension", DumbFormat },
    attach_mappings = function(prompt_bufnr, map)
      map({ "i", "n" }, "<CR>", function()
        open_note(prompt_bufnr)
      end)
      map({ "i", "n" }, delete_note_key, function()
        delete_note(prompt_bufnr)
      end)
      map({ "i", "n" }, new_note_key, function()
        new_note(prompt_bufnr)
      end)
      return true
    end,
  })
end

vim.keymap.set("n", "<leader>md", ":lua DumbNotesList()<CR>", { noremap = true, silent = true })

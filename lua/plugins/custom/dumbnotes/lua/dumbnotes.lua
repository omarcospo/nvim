local DumbFormat = "md"
local DumbPath = "~/Notes"

local function open_note(prompt_bufnr)
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local selection = action_state.get_selected_entry()
  local file_path = vim.fn.expand(DumbPath .. "/" .. selection[1])
  actions.close(prompt_bufnr)
  if vim.fn.filereadable(file_path) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(file_path))
  else
    print("Note not found: " .. file_path)
  end
end

local function delete_note(prompt_bufnr)
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local selection = action_state.get_selected_entry()
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
  local actions = require("telescope.actions")
  actions.close(prompt_bufnr)
  local input = vim.fn.input({ prompt = "Note title: " })
  if input and input ~= "" then
    local file_path = vim.fn.expand(DumbPath .. "/" .. input .. ".md")
    print("Opening note: " .. file_path)
    vim.cmd("edit " .. vim.fn.fnameescape(file_path))
  else
    print("Invalid note title.")
  end
end

function DumbNotesList()
  require("telescope.builtin").find_files({
    prompt_title = "Notes",
    cwd = DumbPath,
    find_command = { "rg", "--files", "--iglob", "*." .. DumbFormat },
    attach_mappings = function(prompt_bufnr, map)
      map({ "i", "n" }, "<CR>", function()
        open_note(prompt_bufnr)
      end)
      map({ "i", "n" }, "<c-d>", function()
        delete_note(prompt_bufnr)
      end)
      map({ "i", "n" }, "<c-n>", function()
        new_note(prompt_bufnr)
      end)
      return true
    end,
  })
end

vim.keymap.set("n", "<leader>md", ":lua DumbNotesList()<CR>", { noremap = true, silent = true })

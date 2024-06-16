local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local entry_display = require("telescope.pickers.entry_display")

local example = function(opts)
  opts = opts or {}

  local displayer = entry_display.create({
    separator = " ",
    items = {
      { width = 40 },
    },
  })

  local make_display = function(entry)
    return displayer({
      entry.filename,
    })
  end

  pickers
    .new(opts, {
      finder = {
        finders.new_oneshot_job(
          { "fd", "--type", "f", "--hidden", "--no-ignore", "--absolute-path", "." },
          { cwd = os.getenv("HOME") .. "/Notes" }
        ),
        entry_maker = function(entry)
          local filename = entry:match("^.+/(.+)$")
          return {
            value = entry,
            display = make_display,
            ordinal = filename,
            filename = entry,
          }
        end,
      },
      sorter = sorters.get_fuzzy_file(),
    })
    :find()
end

example()

return {
  "echasnovski/mini.animate",
  event = "User BaseFile",
  opts = function()
    -- don't use animate when scrolling with the mouse
    local mouse_scrolled = false
    for _, scroll in ipairs({ "Up", "Down" }) do
      local key = "<ScrollWheel" .. scroll .. ">"
      vim.keymap.set({ "", "i" }, key, function()
        mouse_scrolled = true
        return key
      end, { expr = true })
    end

    local animate = require("mini.animate")
    return {
      open = { enable = false }, -- true causes issues on nvim-spectre
      resize = {
        timing = animate.gen_timing.linear({ duration = 33, unit = "total" }),
      },
      scroll = {
        timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        subscroll = animate.gen_subscroll.equal({
          predicate = function(total_scroll)
            if mouse_scrolled then
              mouse_scrolled = false
              return false
            end
            return total_scroll > 1
          end,
        }),
      },
      cursor = {
        enable = false, -- We don't want cursor ghosting
        timing = animate.gen_timing.linear({ duration = 26, unit = "total" }),
      },
    }
  end,
  config = function()
    vim.keymap.set("n", "gg", function()
      vim.g.minianimate_disable = true
      if vim.v.count > 0 then
        vim.cmd("normal! " .. vim.v.count .. "gg")
      else
        vim.cmd("normal! gg0")
      end
      vim.g.minianimate_disable = false
    end)
  end,
}

return {
  "b0o/incline.nvim",
  lazy = false,
  priority = 100,
  dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.diff" },
  after = "oxocarbon.nvim",
  event = "UIEnter",
  config = function()
    --- INCLINE HELPERS -------------------------------------
    local helpers = require("incline.helpers")
    local devicons = require("nvim-web-devicons")
    --- REQUIRE -------------------------------------
    require("mini.diff").setup({
      view = {
        style = "number",
        signs = { add = "▌", change = "▌", delete = "▌" },
      },
    })
    require("incline").setup({
      window = {
        padding = 0,
        margin = {
          vertical = 0,
          horizontal = 0,
        },
        winhighlight = { inactive = { Normal = "InclineNormal" } },
        placement = { vertical = "top", horizontal = "center" },
      },
      render = function(props)
        local bufname = vim.api.nvim_buf_get_name(props.buf)
        local filename = vim.fn.fnamemodify(bufname, ":t")

        if filename == "" then
          filename = "[No Name]"
        end

        local ft_icon = devicons.get_icon_color(filename)

        local function get_diagnostic_label()
          local icons = { error = "󰈜", warn = "󰀧", info = "󰞋", hint = "" }
          local label = {}

          for severity, icon in pairs(icons) do
            local count = vim.fn.len(vim.diagnostic.get(props.buf, { severity = severity }))
            if count > 0 then
              table.insert(label, { icon .. " " .. count .. " ", group = "DiagnosticSign" .. severity })
            end
          end

          return label
        end

        local function get_search()
          local count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
          local contents = vim.fn.getreg("/")
          local label = (" %d/%d "):format(count.current, count.total)
          if count.current == 0 or count.total == 0 then
            return ""
          else
            return label
          end
        end

        local function get_time()
          local label = {}
          local group = props.focused and "Normal" or "Comment"
          table.insert(label, { "| ", group = "Comment" })
          table.insert(label, { os.date("%H:%M"), group = group })
          return label
        end

        local function get_mini_diff()
          local icons = { add = " ", change = " ", delete = " " }
          local signs = vim.b[props.buf].minidiff_summary
          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons) do
            local sign_count = tonumber(signs[name])
            if sign_count and sign_count > 0 then
              local group = props.focused and "MiniDiffSign" .. name or "Normal"
              table.insert(labels, { " ", icon .. sign_count, group = group })
            end
          end
          if #labels > 0 then
            table.insert(labels, { " | ", group = "Comment" })
          end
          return labels
        end

        return {
          -- { " ", get_search() },
          { " ", get_diagnostic_label() },
          { get_mini_diff() },
          { "", filename, " " },
          { "", get_time(), " " },
          guibg = props.focused and "#373b41" or "#151718",
          guifg = props.focused and "#eaeaea" or "#707880",
        }
      end,
    })
    vim.opt.laststatus = 0
    vim.opt.cmdheight = 0
  end,
}

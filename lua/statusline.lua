--- INCLINE HELPERS -------------------------------------
local helpers = require("incline.helpers")
local devicons = require("nvim-web-devicons")
--- REQUIRE -------------------------------------
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

		local function get_mini_diff()
			local icons = { add = " ", change = " ", delete = " " }
			local signs = vim.b[props.buf].minidiff_summary
			local labels = {}
			if signs == nil then
				return labels
			end
			for name, icon in pairs(icons) do
				if tonumber(signs[name]) and signs[name] > 0 then
					table.insert(labels, { " ", icon .. signs[name], group = "MiniDiffSign" .. name })
				end
			end
			if #labels > 0 then
				table.insert(labels, { " ┃ ", guifg = "#4b4641" })
			end
			return labels
		end

		return {
			-- { " ", get_search() },
			{ " ", get_diagnostic_label() },
			{ get_mini_diff() },
			{ "", filename, " " },
			guibg = props.focused and "#383838" or "#181818",
			guifg = props.focused and "#decfa9" or "#4b4641",
		}
	end,
})
vim.opt.laststatus = 3

local lualine = require("lualine")

-- Function to get a color from a highlight group
local function get_color(hl, part)
	local result = vim.api.nvim_get_hl_by_name(hl, true)
	if result[part] then
		return string.format("#%06x", result[part])
	end
	return nil
end

local colors = {
	bg = get_color("CursorLine", "background"),
	fg = get_color("Normal", "foreground"),
	orange = "#FE8019",
	aqua = get_color("Function", "foreground"),
	red = "#FB4934",
	yellow = "#FABD2F",
	cyan = "#83A598",
	purple = "#D3869B",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		component_separators = "",
		section_separators = "",
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = "#282828" } },
		},
		disabled_filetypes = { "NvimTree", "toggleterm" },
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left("mode")

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.aqua, gui = "bold" },
})

ins_left({
	"branch",
	icon = "",
	color = { fg = colors.orange, gui = "bold" },
})

ins_left({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = "󰝤 ", removed = " " },
	diff_color = {
		added = { fg = colors.aqua },
		modified = { fg = colors.purple },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
	function()
		return "%="
	end,
})

ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = "󰈜 ", warn = "󰀧 ", info = "󰞋 " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
})

ins_right({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = "󰒔",
	color = { fg = colors.fg, gui = "bold" },
})

ins_right({ "searchcount" })

lualine.setup(config)

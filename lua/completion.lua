local color = vim.api.nvim_set_hl -- set a color
--- COMPLETION -------------------------------------------------------
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
---
require("cmp").setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "path" },
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = (strings[1] or "") .. " "
			kind.menu = (strings[2] or "")
			return kind
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
})
--- Borders
color(0, "FloatBorder", { bg = "NONE", fg = "#ADADAD" }) -- BG is Padding color and FG border
color(0, "NormalFloat", { bg = "NONE" }) -- Documentation background
--- LUASNIP -------------------------------------------------------
require("luasnip.loaders.from_vscode").lazy_load()

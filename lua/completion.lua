local color = vim.api.nvim_set_hl
--- COMPLETION -------------------------------------------------------
local cmp = require("cmp")
local lspkind = require("lspkind")
local snippy = require("snippy")
---
require("cmp").setup({
	sources = {
		{ name = "nvim_lsp", max_item_count = 10, priority = 1000 },
		{ name = "snippy", max_item_count = 5, priority = 750 },
		{ name = "buffer", max_item_count = 10, priority = 500 },
		{ name = "async_path", priority = 250 },
		{ name = "cmp_tabnine", priority = 250 },
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
			if entry.source.name == "cmp_tabnine" then
				vim_item.kind = ""
				vim_item.abbr = string.sub(vim_item.abbr, 1, 80)
			else
				kind.kind = (strings[1] or "") .. " "
			end
			kind.menu = (strings[2] or "")
			return kind
		end,
	},
	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end,
	},
	matching = {
		disallow_fuzzy_matching = false,
		disallow_fullfuzzy_matching = false,
		disallow_partial_fuzzy_matching = false,
		disallow_partial_matching = false,
		disallow_prefix_unmatching = false,
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
			elseif snippy.can_expand_or_advance() then
				snippy.expand_or_advance()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
--- Borders
color(0, "FloatBorder", { bg = "NONE", fg = "#ADADAD" }) -- BG is Padding color and FG border
color(0, "NormalFloat", { bg = "NONE" }) -- Documentation background

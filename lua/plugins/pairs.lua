return {
	"echasnovski/mini.pairs",
	version = false,
	event = "InsertEnter",
	config = function()
		require("mini.pairs").setup({
			mappings = {
				["<"] = { action = "open", pair = "<>", neigh_pattern = "\r.", register = { cr = false } },
				[">"] = { action = "close", pair = "<>", register = { cr = false } },
			},
		})
	end,
}

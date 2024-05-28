return {
	"phaazon/hop.nvim",
	version = false,
	event = "BufReadPost",
	keys = {
		{
			"f",
			function()
				require("hop").hint_char1({ current_line_only = false })
			end,
			desc = "Jump to char",
		},
	},
	config = function()
		require("hop").setup()
	end,
}

return {
	"NeogitOrg/neogit",
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit cwd=%:p:h<cr>" },
		{ "<leader>gc", "<cmd>Neogit cwd=~/.dotfiles/<cr>" },
	},
	config = function()
		require("neogit").setup({
			mappings = {
				popup = {
					["p"] = "PushPopup",
					["P"] = "PullPopup",
				},
			},
		})
	end,
}

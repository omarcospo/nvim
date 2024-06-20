return {
  {
    "rolv-apneseth/tfm.nvim",
    config = function()
      require("tfm").setup({
        replace_netrw = true,
        file_manager = "lf",
        enable_cmds = false,
        keybindings = {},
        ui = {
          border = "rounded",
          height = 0.8,
          width = 0.75,
          x = 0.5,
          y = 0.5,
        },
      })
      vim.keymap.set("n", "<leader>ff", function()
        require("tfm").open()
      end)
    end,
  },
}

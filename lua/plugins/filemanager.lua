return {
  "is0n/fm-nvim", 
  config = function()
    require("fm-nvim").setup({
      edit_cmd = "edit",
      on_close = {},
      on_open = {},
      ui = {
        default = "float",
        float = {
          border = "rounded",
          float_hl = "Normal",
          border_hl = "FloatBorder",
          blend = 0,
          height = 0.9,
          width = 0.9,
          x = 0.5,
          y = 0.3,
        },
        split = {
          direction = "topright",
          size = 24,
        },
      },
      mappings = {
        vert_split = "<C-h>",
        horz_split = "<C-s>",
        tabedit = "<C-t>",
        edit = "<C-e>",
        ESC = "<ESC>",
      },
      broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson",
    })
    vim.keymap.set("n", "<leader>ff", ":Lf<CR>")
  end,
}

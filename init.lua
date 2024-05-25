pcall(function()
  vim.loader.enable()
end)
-- vim.deprecate = function() end -- Disable deprecation warnings
local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
  wf._watchfunc = function()
    return function() end
  end
end
--- LOAD MODULE FUNCTION --------------------------------------------------------
local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end
--- NVIM API --------------------------------------------------------
vim.keymap.set("n", "<c-,>", ":source $MYVIMRC<cr>")
----- LAZY ------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--- ALL PLUGINS -------------------------------------------------------
require("lazy").setup({
  profiling = { loader = true, require = true },
  defaults = { version = false },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
  --- Dependencies
  "nvim-lua/plenary.nvim",
  { "nvim-tree/nvim-web-devicons" },
  --- Defaults
  { "mateuszwieloch/automkdir.nvim", event = "VeryLazy" },
  { "Shatur/neovim-session-manager" },
  --- Fast UI
  { "sainnhe/gruvbox-material", lazy = false, priority = 101 },
  { "nvim-lualine/lualine.nvim", lazy = false, priority = 100 },
  { "b0o/incline.nvim", lazy = false, priority = 100 },
  { "echasnovski/mini.nvim", lazy = false, priority = 100, version = false },
  --- modeline
  { "brenoprata10/nvim-highlight-colors", event = "VeryLazy" },
  --- completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "onsails/lspkind.nvim", "windwp/nvim-autopairs" },
  },
  { "FelipeLema/cmp-async-path", url = "https://codeberg.org/FelipeLema/cmp-async-path.git" },
  --- Snippet
  { "dcampos/nvim-snippy", event = "VeryLazy" },
  { "dcampos/cmp-snippy", event = "VeryLazy" },
  { "honza/vim-snippets", event = "VeryLazy" },
  { "tzachar/cmp-tabnine", build = "./install.sh" },
  --- looker
  { "nvim-telescope/telescope.nvim", event = "VeryLazy", cmd = "Telescope" },
  { "debugloop/telescope-undo.nvim", cmd = "Telescope undo" },
  "nvim-telescope/telescope-ui-select.nvim",
  { "2kabhishek/nerdy.nvim", dependencies = { "stevearc/dressing.nvim" }, cmd = "Nerdy" },
  { "renerocksai/telekasten.nvim", cmd = "Telekasten find_notes" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope-frecency.nvim" },
  --- Language support
  --- Formatting and agnostic
  { "stevearc/conform.nvim", event = { "BufReadPost", "BufNewFile" } },
  "mfussenegger/nvim-lint",
  {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
  },
  { "michaelb/sniprun", cmd = "SnipRun", build = "./install.sh" },
  --- Python
  "pappasam/nvim-repl",
  --- Typst
  { "kaarmu/typst.vim", ft = "typst" },
  --- Typescript
  { "windwp/nvim-ts-autotag", ft = "typescript" },
  { "pmizio/typescript-tools.nvim", ft = "typescript" },
  ------ LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  { "neovim/nvim-lspconfig", dependencies = { "hrsh7th/cmp-nvim-lsp" } },
  -- Addons
  { "ray-x/lsp_signature.nvim", event = "LspAttach" },
  { "LukasPietzschmann/boo.nvim", event = "LspAttach" },
  { "folke/trouble.nvim", event = "LspAttach" },
  { "dnlhc/glance.nvim", event = "LspAttach" },
  { "zeioth/garbage-day.nvim", event = "LspAttach" },
  { "MysticalDevil/inlay-hints.nvim", event = "LspAttach" },
  --- applications
  { "NeogitOrg/neogit", cmd = "Neogit" },
  { "codota/tabnine-nvim", build = "./dl_binaries.sh" },
  { "akinsho/toggleterm.nvim", version = "*", config = true, cmd = "ToggleTerm" },
  { "is0n/fm-nvim", cmd = "Lf" },
  "TobinPalmer/rayso.nvim",
  { "andweeb/presence.nvim", event = "VeryLazy" },
  --- editing
  { "phaazon/hop.nvim", version = false },
  { "MagicDuck/grug-far.nvim", cmd = "GrugFar" },
  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
})
vim.keymap.set("n", "<c-1>", ":Lazy<cr>")
----- SESSION MANAGER -----------------------------------------------------
local Path = require("plenary.path")
local config = require("session_manager.config")
require("session_manager").setup({
  sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
  session_filename_to_dir = session_filename_to_dir,
  dir_to_session_filename = dir_to_session_filename,
  autoload_mode = config.AutoloadMode.LastSession,
  autosave_last_session = true,
  autosave_ignore_not_normal = true,
  autosave_ignore_dirs = {},
  autosave_ignore_filetypes = {},
  autosave_ignore_buftypes = {},
  autosave_only_in_session = false,
  max_path_length = 80,
})
--- Modules -------------------------------------------------------
load("ui")
load("defaults")
load("statusline")
load("modeline")
load("completion")
load("looker")
load("lsp")
load("languages")
load("applications")
load("editing")

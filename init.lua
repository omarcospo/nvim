pcall(function()
  vim.loader.enable()
end)
----------------------
require("config.options")
require("config.mappings")
require("config.autocmds")
require("plugin-manager")
-- require("config.gruvbox")

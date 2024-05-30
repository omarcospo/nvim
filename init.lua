pcall(function()
  vim.loader.enable()
end)
vim.deprecate = function() end -- Disable deprecation warnings
----------------------
require("config.options")
require("config.mappings")
require("config.autocmds")
require("plugin-manager")
-- require("config.gruvbox")

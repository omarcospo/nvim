pcall(function()
  vim.loader.enable()
end)
----------------------
require("config.options")
require("config.mappings")
require("plugin-manager")

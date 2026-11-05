-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()
require("options")
require("keymap")
require("pkgs")

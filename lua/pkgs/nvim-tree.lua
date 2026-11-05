vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local gh = require("libs").gh

vim.pack.add({
  {
    src = gh("nvim-tree/nvim-tree.lua"),
  },
  {
    src = gh("nvim-tree/nvim-web-devicons"),
  },
})

require("nvim-tree").setup({
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
})

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>e", api.tree.toggle, {
  desc = "NvimTree toggle",
})
vim.keymap.set("n", "<leader>ef", api.tree.find_file, {
  desc = "NvimTree find file",
})

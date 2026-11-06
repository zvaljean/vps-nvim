vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local gh = require("libs").gh

vim.pack.add({
  {src = gh("nvim-tree/nvim-tree.lua"),},
  {src = gh("nvim-tree/nvim-web-devicons"),},
})

require("nvim-tree").setup({
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
})

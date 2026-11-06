local gh = require("libs").gh

vim.pack.add({
  {
    src = gh("folke/tokyonight.nvim"),
  },
})

require("tokyonight").setup({
  style = "night",
  transparent = false,
  terminal_colors = true,
})

vim.cmd.colorscheme("tokyonight-night")

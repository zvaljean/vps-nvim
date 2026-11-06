local gh = require("libs").gh

vim.pack.add({
  {
    src = gh("catppuccin/nvim"),
    name = "catppuccin",
  },
})

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  float = {
    transparent = true,
    solid = false,
  },
  term_colors = true,
  auto_integrations = true,
  integrations = {
    gitsigns = true,
    nvimtree = true,
    telescope = {
      enabled = true,
    },
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
})

vim.cmd.colorscheme("catppuccin-nvim")

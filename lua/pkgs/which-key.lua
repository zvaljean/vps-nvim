local gh = require("libs").gh

vim.pack.add({
  {
    src = gh("folke/which-key.nvim"),
  },
})

local wk = require("which-key")

wk.setup({})
wk.add({
  {
    "<leader>w",
    desc = "Save file",
  },
  {
    "<leader>q",
    desc = "Quit window",
  },
  {
    "<leader>r",
    desc = "Reload Neovim configuration",
  },
  {
    "<leader>e",
    desc = "NvimTree toggle",
  },
  {
    "<leader>ef",
    desc = "NvimTree find file",
  },
  {
    "<leader>f",
    group = "Find",
  },
  {
    "<leader>ff",
    desc = "Telescope find files",
  },
  {
    "<leader>fg",
    desc = "Telescope live grep",
  },
  {
    "<leader>fb",
    desc = "Telescope buffers",
  },
  {
    "<leader>fh",
    desc = "Telescope help tags",
  },
})

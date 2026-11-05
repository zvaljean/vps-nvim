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
    "<leader>f",
    group = "Find",
  },
})

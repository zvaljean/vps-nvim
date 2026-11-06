local gh = require("libs").gh

vim.pack.add({
  {src = gh("stevearc/dressing.nvim"),},
})

require("dressing").setup({})

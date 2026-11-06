local gh = require("libs").gh

vim.pack.add({
	  { src = gh("nvim-mini/mini.nvim") },
})

require("mini.indentscope").setup({
	  symbol = "│",
	  options = { try_as_border = true },
								 })

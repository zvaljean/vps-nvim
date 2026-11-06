local gh = require("libs").gh

vim.pack.add({
	  { src = gh("nvim-lualine/lualine.nvim") },
})

require("lualine").setup({
	  options = {
		 -- theme = "tokyonight",
		 -- theme = "catppuccin-nvim",
		 theme = "auto",
		 globalstatus = true,
		 component_separators = "│",
		 section_separators = "",
	  },
						})

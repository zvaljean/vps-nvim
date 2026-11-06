local gh = require("libs").gh

vim.pack.add({
	  { src = gh("akinsho/bufferline.nvim") },
	  { src = gh("nvim-tree/nvim-web-devicons") },
})

require("bufferline").setup({
	  options = {
		 mode = "buffers",
		 indicator = {
			style = "underline",
		 },
		 max_name_length = 20,
		 max_prefix_length = 20,
		 truncate_names = true,
		 show_buffer_icons = true,
		 show_buffer_close_icons = false,
		 show_close_icon = false,
		 show_tab_indicators = true,
		 show_duplicate_prefix = true,
		 modified_icon = "",
		 --  在打开多个 Buffer 或切换 Tab 时会自动把 vim.o.showtabline = 2
		 auto_toggle_bufferline = false,
		 always_show_bufferline = false,
		 themable = true,
		 diagnostics = "nvim_lsp",
		 separator_style = "none",
		 show_buffer_close_icons = false,
		 offsets = {
			{
			   filetype = "NvimTree",
			   text = "",
			   highlight = "Normal",
			   text_align = "left",
			   separator = false,
			},
		 },
		 name_formatter = function(buf)
			local name = vim.fn.fnamemodify(buf.name, ":t:r")
			if vim.bo[buf.bufnr].modified then
			   return name .. " ●"
			end
			return name
		 end,
	  },
						   })

-- 默认隐藏 Bufferline，由 Which-key 的 <leader>uB 手动切换。
vim.o.showtabline = 0

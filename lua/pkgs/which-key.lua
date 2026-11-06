local gh = require("libs").gh

vim.pack.add({
	  { src = gh("folke/which-key.nvim") },
})

local wk = require("which-key")

wk.setup({})
-- stylua: ignore start
wk.add({
	  { "<leader>w", desc = "Save file" },
	  { "<leader>q", desc = "Quit window" },
	  { "<leader>r", desc = "Reload Neovim configuration" },
	  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree toggle" },
	  { "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTree find file" },

	  { "<leader>f", group = "Find" },
	  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
	  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
	  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
	  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },

	  { "<leader>b", group = "Buffer" },
	  { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Select buffer" },
	  { "<leader>bn", "<cmd>bnext<cr>", desc = "Next buffer" },
	  { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous buffer" },
	  { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete buffer" },

	  { "<leader>t", group = "Tab" },
	  { "<leader>tt", "<cmd>tabnew<cr>", desc = "New tab" },
	  { "<leader>tn", "<cmd>tabnext<cr>", desc = "Next tab" },
	  { "<leader>tp", "<cmd>tabprevious<cr>", desc = "Previous tab" },
	  { "<leader>tc", "<cmd>tabclose<cr>", desc = "Close tab" },
	  { "<leader>to", "<cmd>tabonly<cr>", desc = "Keep current tab" },
})
-- stylua: ignore end

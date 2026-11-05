local gh = require("libs").gh
local telescope_plugins = {
   {
	  src = gh("nvim-lua/plenary.nvim"),
   },
   {
	  src = gh("nvim-telescope/telescope.nvim"),
	  -- Git branch, tag, or commit hash.
	  version = "v0.2.2",
   },
   {
	  src = gh("nvim-telescope/telescope-ui-select.nvim"),
   },
}

-- if vim.fn.executable("make") == 1 then
--   table.insert(telescope_plugins, {
--     src = gh("nvim-telescope/telescope-fzf-native.nvim"),
--   })
-- end

vim.pack.add(telescope_plugins)

require("telescope").setup({
	  extensions = {
		 ["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		 },
	  },
						  })

pcall(require("telescope").load_extension, "ui-select")
-- pcall(require("telescope").load_extension, "fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {
				  desc = "Telescope find files",
})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
				  desc = "Telescope live grep",
})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {
				  desc = "Telescope buffers",
})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
				  desc = "Telescope help tags",
})

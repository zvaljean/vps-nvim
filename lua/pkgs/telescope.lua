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
	  defaults = {
		 winblend = 0,
	  },
	  extensions = {
		 ["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		 },
	  },
						  })

pcall(require("telescope").load_extension, "ui-select")
-- pcall(require("telescope").load_extension, "fzf")

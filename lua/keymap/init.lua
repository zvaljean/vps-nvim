vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit window" })

vim.keymap.set("n", "<leader>r", function()
				  local config = vim.env.MYVIMRC
				  if not config or config == "" then
					 config = vim.fn.stdpath("config") .. "/init.lua"
				  end
				  vim.cmd("source " .. vim.fn.fnameescape(config))
				  vim.notify("Neovim configuration reloaded", vim.log.levels.INFO)
end, { desc = "Reload Neovim configuration" })

local gh = require("libs").gh
vim.pack.add({
	  { src = gh("folke/which-key.nvim") },
})
local wk = require("which-key")
wk.setup({})

-- 基础快捷键统一在下方 basic subtree 的 wk.add rhs 中定义。

-- stylua: ignore start
local reload =  function()
   local config = vim.env.MYVIMRC
   if not config or config == "" then
      config = vim.fn.stdpath("config") .. "/init.lua"
   end
   vim.cmd("source " .. vim.fn.fnameescape(config))
   vim.notify("Neovim configuration reloaded", vim.log.levels.INFO)
end

local triggle_tabline= function()
   vim.o.showtabline = vim.o.showtabline == 0 and 2 or 0
end

wk.add({
	  { "<leader>w", "<cmd>write<cr>", desc = "Save file" },
	  { "<leader>W", "<cmd>wall<cr>", desc = "Save all file" },
	  { "<leader>q", "<cmd>quit<cr>", desc = "Quit window" },
	  { "<leader>Q", "<cmd>quitall<cr>", desc = "Quit all window" },
	  { "<leader>r",  reload, desc = "Reload Neovim configuration" },
	  { "<leader>ua", "<cmd>ASToggle<cr>", desc = "Toggle auto-save" },
	  { "jk", "<Esc>", mode = "i", desc = "Exit insert mode" },
	  { "<leader>uB", triggle_tabline, desc = "Toggle bufferline" },
	  { "<C-x><C-;>", "gcc", mode = "n", remap = true, desc = "Toggle comment" },
	  { "<C-x><C-;>", "gc", mode = "v", remap = true, desc = "Toggle comment" },
	  { "<C-c><C-f>", function()
	    require("conform").format({ lsp_format = "fallback" })
	  end, mode = { "n", "v" }, desc = "Format buffer or selection" },
	  -- like emacs
})

wk.add({
	  { "<leader>f", group = "Find" },
	  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
	  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
	  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
	  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
})

wk.add({
	  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree toggle" },
	  { "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTree find file" },
})

wk.add({
	  { "<leader>t", group = "Tab" },
	  { "<leader>tt", "<cmd>tabnew<cr>", desc = "New tab" },
	  { "<leader>tn", "<cmd>tabnext<cr>", desc = "Next tab" },
	  { "<leader>tp", "<cmd>tabprevious<cr>", desc = "Previous tab" },
	  { "<leader>tc", "<cmd>tabclose<cr>", desc = "Close tab" },
	  { "<leader>to", "<cmd>tabonly<cr>", desc = "Keep current tab" },
})

local close_buffer = function()
   local is_empty_unnamed = vim.api.nvim_buf_get_name(0) == ""
	  and vim.bo.buftype == ""
	  and vim.api.nvim_buf_line_count(0) == 1
	  and vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] == ""
   if is_empty_unnamed then
	  vim.cmd("q!")
   else
	  vim.cmd("q")
   end
end

wk.add({
	  { "<leader>b", group = "Buffer" },
	  { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Select buffer" },
	  { "<leader>bn", "<cmd>bnext<cr>", desc = "Next buffer" },
	  { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous buffer" },
	  { "<leader>bd", close_buffer, desc = "Close buffer" },
})
-- stylua: ignore end

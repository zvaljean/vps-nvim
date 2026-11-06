vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.mouse = "a"
  vim.opt.termguicolors = true
  vim.opt.expandtab = true
  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
  vim.opt.signcolumn = "yes"
  vim.opt.updatetime = 250
-- timeoutlen 控制 Neovim 等待后续按键的时间
  vim.opt.timeoutlen = 250

-- 使用 Treesitter 计算代码折叠层级
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 启动时展开全部折叠，但仍保留手动折叠能力
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"

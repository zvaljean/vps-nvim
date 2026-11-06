local gh = require("libs").gh

vim.pack.add({
  {src = gh("nvim-treesitter/nvim-treesitter"),},
})

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "json",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "nix",
    "query",
    "vim",
    "vimdoc",
  },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

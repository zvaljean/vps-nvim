local gh = require("libs").gh

vim.pack.add({
  {
    src = gh("akinsho/bufferline.nvim"),
  },
  {
    src = gh("nvim-tree/nvim-web-devicons"),
  },
})

require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    separator_style = "slant",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      },
    },
  },
})

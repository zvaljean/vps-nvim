local gh = require("libs").gh

vim.pack.add({
  { src = gh("stevearc/conform.nvim") },
})

require("conform").setup({
  formatters_by_ft = {
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
    nix = { "alejandra" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    lua = { "stylua" },
    json = { "prettier" },
    jsonc = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

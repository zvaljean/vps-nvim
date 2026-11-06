local gh = require("libs").gh

vim.pack.add({
  {
    src = gh("okuuva/auto-save.nvim"),
    version = "v1.0.0",
  },
})

local excluded_filetypes = {
  "gitcommit",
  "help",
  "NvimTree",
  "prompt",
  "qf",
  "TelescopePrompt",
  "terminal",
  "toggleterm",
}

require("auto-save").setup({
  enabled = true,
  trigger_events = {
    immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
    defer_save = { "InsertLeave", "TextChanged" },
    cancel_deferred_save = { "InsertEnter" },
  },
  condition = function(buf)
    if vim.fn.getbufvar(buf, "&buftype") ~= "" then
      return false
    end

    if vim.fn.getbufvar(buf, "&modifiable") ~= 1 then
      return false
    end

    if vim.fn.getbufvar(buf, "&readonly") == 1 then
      return false
    end

    if vim.api.nvim_buf_get_name(buf) == "" then
      return false
    end

    return not vim.tbl_contains(excluded_filetypes, vim.bo[buf].filetype)
  end,
  write_all_buffers = false,
  debounce_delay = 1000,
})

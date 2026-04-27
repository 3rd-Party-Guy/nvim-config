local options = {
  formatters = {
    odinfmt = {
      command = { "/home/nikolay.hadzhiev/.local/share/nvim/mason/packages/ols/odinfmt-x86_64-unknown-linux-gnu" },
      args = { "-stdin" },
      stdin = true,
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    odin = { "odinfmt" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options

require("nvchad.configs.lspconfig").defaults()

-- Define servers using Neovim's native API (0.11+)
vim.lsp.config("perlnavigator", {
  cmd = { "perlnavigator" },
  filetypes = "perl",
  settings = {
    perlnavigator = {
      perlPath = "perl",
      enableWarnings = true,
      includePaths = {},
      perlcriticEnabled = true,
      perlcriticProfile = "/opt/prod/odyn-erp/.perlcriticrc",
    },
  },
})

vim.lsp.config("zls", {
  cmd = { "/home/nikolay.hadzhiev/.zvm/bin/zls" },
  filetypes = "zig",
  settings = {
    zls = {
      zig_exe_path = "/home/nikolay.hadzhiev/.zvm/bin/zig",
      warn_style = true,
      enable_autofix = true,
    },
  },
})

vim.lsp.config("ols", {
  cmd = { "ols" },
  filetypes = "odin",
  init_options = {
    checker_args = "-strict-style",
    collections = {
      { name = "core",   path = "/usr/local/odin/core" },
      { name = "vendor", path = "/usr/local/odin/vendor" },
    },
    enable_semantic_tokens = false,
    enable_document_symbols = true,
    enable_hover = true,
    enable_snippets = true,
    enable_auto_import = true,
    verbose = true,
    enable_format = true,
  },
})

vim.lsp.enable({ "perlnavigator", "zls", "ols" })

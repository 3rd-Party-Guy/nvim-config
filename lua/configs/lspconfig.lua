require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- Configure servers
lspconfig.perlnavigator.setup {
  name = "perlnavigator",
  cmd = { "perlnavigator" },
  filetypes = "perl",
  settings = {
    perlnavigator = {
      perlPath = "perl",
      enableWarnings = true,
      includePaths = {},
      perlcriticEnabled = true,
      perlcriticProfile = '/opt/prod/odyn-erp/.perlcriticrc',
    },
  },
}

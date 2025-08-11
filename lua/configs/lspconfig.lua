require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- Configure servers
-- Paste your configuration here, LSPs are started automatically if filetypes is defined correctly.
-- Example:
-- lspconfig.perlnavigator.setup {
--   name = "perlnavigator",
-- cmd = { "perlnavigator" },
-- filetypes = "perl",
-- settings = {
-- perlnavigator = {
--      perlPath = "perl", <- this is defined in init.lua
--      enableWarnings = true,
--      includePaths = {},
--      perlcriticEnabled = true,
--      perlcriticProfile = '/opt/prod/odyn-erp/.perlcriticrc',
--    },
--  },
}

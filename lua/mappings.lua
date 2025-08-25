require "nvchad.mappings"

local map = vim.keymap.set

-- Normal mode navigation
map("n", "j", "h", { desc = "Move left" })
map("n", "k", "j", { desc = "Move up" })
map("n", "l", "k", { desc = "Move down" })
map("n", ";", "l", { desc = "Move right" })

-- Visual mode navigation
map("v", "j", "h", { desc = "Move left" })
map("v", "k", "j", { desc = "Move up" })
map("v", "l", "k", { desc = "Move down" })
map("v", ";", "l", { desc = "Move right" })

-- Window navigation
map("n", "<C-j>", "<C-w>h", { desc = "Focus left window" })
map("n", "<C-k>", "<C-w>j", { desc = "Focus up window" })
map("n", "<C-l>", "<C-w>k", { desc = "Focus down window" })
map("n", "<C-;>", "<C-w>l", { desc = "Focus right window" })

-- Telescope
map("n", "<leader>fc", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Telescope (<leader>fw) with global file pattern" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- LSP
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "(LSP) Go to definition" })
map("n", "<leader>gn", vim.lsp.buf.rename, { desc = "(LSP) Rename" })
map("n", "<leader>gh", vim.lsp.buf.hover, { desc = "(LSP) Hover" })
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "(LSP) References" })

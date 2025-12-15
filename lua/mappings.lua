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

-- Windows
map("n", "<C-j>", "<C-w>h", { desc = "Focus left window" })
map("n", "<C-k>", "<C-w>j", { desc = "Focus up window" })
map("n", "<C-l>", "<C-w>k", { desc = "Focus down window" })
map("n", "<C-;>", "<C-w>l", { desc = "Focus right window" })
map("n", "<C-w>h", "<cmd>split<CR>", { desc = "Split window horizontally" })

-- Telescope
map("n", "<leader>fc", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Telescope (<leader>fw) with global file pattern" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- LSP
map("n", "<leader>lgd", "<cmd>Lspsaga goto_definition<CR>", { desc = "(LSP) Go to definition" })
map("n", "<leader>lgt", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "(LSP) Go to type definition" })
map("n", "<leader>lpd", "<cmd>Lspsaga peek_definition<CR>", { desc = "(LSP) Peek definition" })
map("n", "<leader>lpt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "(LSP) Peek type definition" })
map("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", { desc = "(LSP) LSPSaga Finder" })
map("n", "<leader>lr", "<cmd>Lspsaga finder ref<CR>", { desc = "(LSP) LSPSaga References" })
map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "(LSP) LSPSaga Outline" })
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "(LSP) Hover" })
map("n", "<leader>ln", "<cmd>Lspsaga rename<CR>", { desc = "(LSP) Rename" })
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "(LSP) Code Action" })
map("n", "<leader>lci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "(LSP) Callhierarchy incoming" })
map("n", "<leader>lco", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "(LSP) Callhierarchy outgoing" })
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "(LSP) Jump to next diagnostic" })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "(LSP) Jump to previous diagnostic" })

-- zig
map("n", "<leader>zr", "<cmd>TermExec size=40 dir=git_dir direction=horizontal name=zig-build cmd='zig build run'<CR>", { desc = "" })

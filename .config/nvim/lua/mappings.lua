require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Disabled

map("t", "A-i", "")
map("t", "A-h", "")
map("t", "A-v", "")
map("n", "<leader>h", "")
map("n", "<leader>v", "")

-- I want to know who in the nvchad bind this to copy the whole document
-- Who in the right mind would do that???
map("n", "<C-c>", "")

-- General

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "gl", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })

map("n", "<M-j>", "<cmd> m .+1<CR>", { desc = "move line up" })
map("n", "<M-k>", "<cmd> m .-2<CR>", { desc = "move line up" })
map("n", "<leader>q", "<cmd> q<CR>", { desc = "quit" })
map("n", "<leader>;", "<cmd> Nvdash<CR>", { desc = "open dashboard" })

map("v", ">", ">gv", { desc = "indent" })
map("v", "<M-j>", ":m '>+1<CR>gv", { desc = "move line up" })
map("v", "<M-k>", ":m '<-2<CR>gv", { desc = "move line up" })

-- Lspconfig

map("n", "<leader>lk", function()
  vim.diagnostic.goto_prev { float = { border = "rounded" } }
end, { desc = "Goto Prev" })
map("n", "<leader>lj", function()
  vim.diagnostic.goto_next { float = { border = "rounded" } }
end, { desc = "Goto Next" })

-- Tabufline

map("n", "<M-tab>", function()
  require("nvchad.tebufline").move_buf(1)
end, { desc = "Move buffer right" })
map("n", "<M-tab>", function()
  require("nvchad.tebufline").move_buf(-1)
end, { desc = "Move buffer left" })

-- Telescope

map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find document symbol" })
map("n", "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Find workspace symbol" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles only_cwd=true<CR>", { desc = "Find oldfiles" })
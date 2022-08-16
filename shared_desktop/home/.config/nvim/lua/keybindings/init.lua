local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

vim.g.mapleader = " "

map("i", "jj", "<ESC>", opts)
map("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
map("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)

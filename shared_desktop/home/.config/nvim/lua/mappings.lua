vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("i", "jj", "<ESC>", nil)
vim.keymap.set("n", "<leader>x", ":Ex<cr>", nil)
vim.keymap.set("n", "<C-d>", "<C-d>zz", nil)
vim.keymap.set("n", "<C-u>", "<C-u>zz", nil)
vim.keymap.set("n", "n", "nzz", nil)
vim.keymap.set("n", "N", "Nzz", nil)
vim.keymap.set("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", nil)
vim.keymap.set("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", nil)
vim.keymap.set("n", "<leader>nw", "<cmd>Neorg workspace notes<cr>", nil)
vim.keymap.set("n", "<leader>nr", "<cmd>Neorg return<cr>", nil)

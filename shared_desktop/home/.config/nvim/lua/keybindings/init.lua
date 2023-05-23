local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<ESC>", opts);
vim.keymap.set("n", "<leader>x", ":Ex<cr>", opts);
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts);
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts);
vim.keymap.set("n", "n", "nzz", opts);
vim.keymap.set("n", "N", "Nzz", opts);
map("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
map("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

vim.g.mapleader = " "

map("i", "jj", "<ESC>", opts)

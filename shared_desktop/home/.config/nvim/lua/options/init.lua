vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.autoindent = true
vim.opt.smartindent = true


vim.opt.termguicolors = true

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 5
vim.opt.hidden = true -- allow buffers to remain open in background with unsaved changes
vim.opt.number = true -- enable line numbers
vim.opt.signcolumn = "number" -- show diag errors in the number column (saves on width)

vim.opt.background = "dark"
vim.g.gruvbox_material_background = "hard"
vim.cmd("colorscheme gruvbox-material")

-- Javascript 
vim.api.nvim_command("autocmd FileType javascript,javascriptreact,javascript.jsx,typescript,typescriptreact,typescript.tsx,css,lua,json setlocal shiftwidth=2 tabstop=2 softtabstop=2");

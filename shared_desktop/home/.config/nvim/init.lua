local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end
require('plugins.packer')

if is_bootstrap then
  require('packer').sync()
  return
end

require('plugins.lsp-config')
require('nvim-treesitter.configs').setup {
    highlight = { enable = true },
    ensure_installed = "all",
}
require('plugins.telescope')
require('options')
require('keybindings')

-- add patched font to enable icons
-- https://www.nerdfonts.com/font-downloads
require('lualine').setup {
  options = {
    icons_enabled = true,
  }
}
local ajp = {}

vim.api.nvim_exec(
  [[
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx call v:lua.ajp.jsfmt()
    autocmd BufWritePre *.css call v:lua.ajp.cssfmt()
    autocmd BufWritePre *.go call v:lua.ajp.gofmt()
    autocmd BufWritePre *.rs call v:lua.ajp.rustfmt()
    autocmd BufWritePre *.lua call v:lua.ajp.luafmt()
  ]],
  false
)

function ajp.jsfmt()
  local cmd = string.format('prettier --stdin-filepath %s', vim.api.nvim_buf_get_name(0))
  ajp.format(cmd, false)
end

function ajp.cssfmt()
  local cmd = string.format('prettier --stdin-filepath %s', vim.api.nvim_buf_get_name(0))
  ajp.format(cmd, false)
end

function ajp.gofmt()
  ajp.format("goimports", false)
end

function ajp.rustfmt()
  ajp.format("rustfmt", false)
end

function ajp.luafmt()
  ajp.format("stylua - ", false)
end

function ajp.format(cmd, alert)
  local buf = vim.api.nvim_get_current_buf()
  local output = vim.fn.system(cmd, buf)
  local lines = vim.fn.split(output, "\n")
  if vim.v.shell_error == 0 then
    vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines)
  else
    if alert then
      require("ajp.util").alertBox(lines)
    else
      print("Error formatting code...")
    end
  end
end


_G.ajp = ajp

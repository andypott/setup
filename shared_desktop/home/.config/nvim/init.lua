require('plugins.packer')
require('plugins.lsp-config')
require('nvim-treesitter.configs').setup {
    highlight = { enable = true },
    ensure_installed = "all",
}
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

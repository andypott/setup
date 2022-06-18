local util = {}

function util.alertBox(lines)
    local errbuf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(errbuf, 0, -1, false, lines)
    local keyopts = {
        silent = true,
        nowait = true,
        noremap = true,
    }
    vim.api.nvim_buf_set_keymap(errbuf, "n", "<Esc>", ":close<CR>", keyopts)
    vim.api.nvim_buf_set_keymap(errbuf, "n", "<CR>", ":close<CR>", keyopts)
    vim.api.nvim_buf_set_keymap(errbuf, "n", "<Space>", ":close<CR>", keyopts)


    local winWidth = vim.api.nvim_win_get_width(0)
    local winHeight = vim.api.nvim_win_get_height(0)
    local w = 80
    local h = 20
    local minWidth = 40
    local minHeight = 8
    local border = 4

    if (winWidth - border) < w then
        w = winWidth - border
        if w < minWidth then
            w = minWidth
        end
    end

    if (winHeight - border) < h then
        h = winHeight - border
        if h < minHeight then
            h = minHeight
        end
    end

    local winopts = {
        relative = "win",
        width = w,
        height = h,
        row = (winHeight - h) / 2,
        col = (winWidth - w) / 2,
        style = "minimal",
        border = "single",
        focusable = false,
    }
    vim.api.nvim_open_win(errbuf, true, winopts)
end

return util

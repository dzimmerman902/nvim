local M = {
    'echasnovski/mini.cursorword',
    lazy = false,
}

function M.config()
    require('mini.cursorword').setup {
        delay = 100,
    }
end

return M

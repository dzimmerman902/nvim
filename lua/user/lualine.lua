local M = {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'AndreM222/copilot-lualine',
    },
}

function M.config()
    require('lualine').setup {}
end

return M

local M = {
    'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
}

function M.config()
    require('nvim-web-devicons').setup {}
end

return M

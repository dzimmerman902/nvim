local M = {
    'AckslD/nvim-neoclip.lua',
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
}

function M.config()
    require('neoclip').setup {}
end

return M

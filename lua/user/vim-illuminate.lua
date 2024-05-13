local M = {
    'RRethy/vim-illuminate',
    lazy = false,
}

function M.config()
    require('illuminate').configure {}
end

return M


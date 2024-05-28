local M = {
    'chrisgrieser/nvim-various-textobjs',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
}

function M.config()
    require('various-textobjs').setup { useDefaultKeymaps = true }
end

return M

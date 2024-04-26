local M = {
    'f-person/git-blame.nvim',
    lazy = false,
}

function M.config()
    require('gitblame').setup {
        enabled = true,
    }
end

return M

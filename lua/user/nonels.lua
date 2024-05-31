local M = {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
}

function M.config()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting

    null_ls.setup {
        debug = false,
        sources = {
            formatting.stylua,
            formatting.prettierd,
            formatting.terraform_fmt,
        },
    }
end

return M

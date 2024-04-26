local M = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
    },
}

function M.config()
    local wk = require 'which-key'

    wk.register {
        ['<leader>M'] = { '<cmd>Mason<cr>', 'Mason' },
    }

    local servers = {
        'lua_ls',
        'cssls',
        'html',
        'tsserver',
        'pyright',
        'bashls',
        'jsonls',
    }

    require('mason').setup {
        ui = {
            border = 'rounded',
        },
    }

    require('mason-lspconfig').setup {
        ensure_installed = servers,
    }
end

return M

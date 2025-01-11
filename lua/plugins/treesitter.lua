-- return {}
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            highlight = {
                enable = true,
                disable = { 'markdown' },
            },
            ensure_installed = {
                'html',
                'javascript',
                'typescript',
                'vim',
                'lua',
                'regex',
                'jsdoc',
                'terraform',
            },
        })
    end,
}

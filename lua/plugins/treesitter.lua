return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            highlight = {
                enable = true,
            },
            ensure_installed = {
                'html',
                'javascript',
                'typescript',
                'vim',
                'lua',
                'regex',
                'jsdoc',
                'markdown',
                'markdown_inline',
                'terraform',
            },
        })
    end,
}

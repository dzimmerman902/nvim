return {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = { style = 'moon' },
    config = function()
        vim.cmd('colorscheme tokyonight')
    end,
}

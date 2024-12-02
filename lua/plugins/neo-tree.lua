return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '<leader>e', '<cmd>Neotree position=current<cr>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ['<leader>e'] = 'close_window',
                },
            },
        },
    },
}

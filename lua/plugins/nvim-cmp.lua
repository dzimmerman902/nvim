return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },
    event = 'InsertEnter',
    config = function()
        local cmp = require('cmp')

        cmp.setup({
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),

                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                ['<C-e>'] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                -- ['<Tab>'] = cmp.mapping(function(fallback)
                --     local col = vim.fn.col('.') - 1
                --
                --     if cmp.visible() then
                --         cmp.select_next_item({ behavior = 'select' })
                --     elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                --         fallback()
                --     else
                --         cmp.complete()
                --     end
                -- end, { 'i', 's' }),
                --
                -- -- Go to previous item
                -- ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
            }),
            window = {
                completion = {
                    border = 'rounded',
                },
                documentation = {
                    border = 'rounded',
                },
            },
            experimental = {
                ghost_text = false,
            },
        })
    end,
}

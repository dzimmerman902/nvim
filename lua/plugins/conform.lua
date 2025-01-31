return { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format({ async = true, lsp_format = 'fallback' })
            end,
            desc = '[F]ormat buffer',
        },
    },
    opts = {
        notify_on_error = true,
        formatters = {
            -- ['markdown-toc'] = {
            --     condition = function(_, ctx)
            --         for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
            --             if line:find('<!%-%- toc %-%->') then
            --                 return true
            --             end
            --         end
            --     end,
            -- },
            -- ['markdownlint-cli2'] = {
            --     condition = function(_, ctx)
            --         local diag = vim.tbl_filter(function(d)
            --             return d.source == 'markdownlint'
            --         end, vim.diagnostic.get(ctx.buf))
            --         return #diag > 0
            --     end,
            -- },
        },
        formatters_by_ft = {
            lua = { 'stylua' },
            javascript = { 'prettier' },
            json = { 'prettier' },
            ['markdown'] = { 'prettier' },
            ['markdown.mdx'] = { 'prettier' },
            xml = { 'xmlformatter' },
        },
    },
}

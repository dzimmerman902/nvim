local servers = { 'lua_ls', 'ts_ls' }

return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'folke/neodev.nvim' },
    config = function()
        local lspconfig = require('lspconfig')

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = false,
            underline = true,
        })

        local on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>Telescope lsp_type_definitions<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            vim.keymap.set('n', '<leader>ci', '<cmd>LspInfo<cr>', opts)
        end

        local common_capabilities = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            return capabilities
        end

        for _, server in pairs(servers) do
            local opts = {
                on_attach = on_attach,
                capabilities = common_capabilities(),
            }

            if server == 'lua_ls' then
                require('neodev').setup({})

                opts = vim.tbl_deep_extend('force', {
                    on_init = function(client)
                        if client.workspace_folders then
                            local path = client.workspace_folders[1].name
                            if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                                return
                            end
                        end

                        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                            runtime = {
                                version = 'LuaJIT',
                            },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                },
                            },
                        })
                    end,
                    settings = {
                        Lua = {},
                    },
                }, opts)
            end

            if server == 'ts_ls' then
                opts = vim.tbl_deep_extend('force', {
                    init_options = {
                        plugins = {
                            {
                                name = '@vue/typescript-plugin',
                                location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
                                languages = { 'javascript', 'typescript' },
                            },
                        },
                    },
                    filetypes = {
                        'javascript',
                        'typescript',
                    },
                }, opts)
            end

            lspconfig[server].setup(opts)
        end

        -- LUA
        -- require('lspconfig').lua_ls.setup({
        --     on_init = function(client)
        --         if client.workspace_folders then
        --             local path = client.workspace_folders[1].name
        --             if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
        --                 return
        --             end
        --         end
        --
        --         client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        --             runtime = {
        --                 version = 'LuaJIT',
        --             },
        --             workspace = {
        --                 checkThirdParty = false,
        --                 library = {
        --                     vim.env.VIMRUNTIME,
        --                 },
        --             },
        --         })
        --     end,
        --     settings = {
        --         Lua = {},
        --     },
        -- })

        -- TYPESCRIPT
        -- require('lspconfig').ts_ls.setup({
        --     init_options = {
        --         plugins = {
        --             {
        --                 name = '@vue/typescript-plugin',
        --                 location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
        --                 languages = { 'javascript', 'typescript' },
        --             },
        --         },
        --     },
        --     filetypes = {
        --         'javascript',
        --         'typescript',
        --     },
        -- })
    end,
}

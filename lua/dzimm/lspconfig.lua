local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<LEADER>ld', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<LEADER>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<LEADER>sh', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<LEADER>td', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<LEADER>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<LEADER>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use' },
            },
        },
    },
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig.bashls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        cmd_env = {
            GLOB_PATTERN = '*@(.zsh|.sh|.inc|.bash|.command)',
        },
    },
}

lspconfig.eslint.setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

require('config.utils')
require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.lazy')

vim.cmd('colorscheme tokyonight')

-- local lspconfig_defaults = require('lspconfig').util.default_config
--
-- lspconfig_defaults.capabilities =
--     vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

-- LSP
-- vim.api.nvim_create_autocmd('LspAttach', {
--     desc = 'LSP actions',
--     callback = function(event)
--         local opts = { buffer = event.buf }
--
--         -- stylua: ignore start
--         vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
--         vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
--         vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
--         vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
--         vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
--         vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
--         vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
--         vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
--         vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
--         vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
--         -- stylua: ignore end
--     end,
-- })

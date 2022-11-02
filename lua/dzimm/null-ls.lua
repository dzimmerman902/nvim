local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<LEADER>p', ':lua vim.lsp.buf.format({ async = true })<CR>', opts)

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
    },
}

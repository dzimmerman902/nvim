local status_ok, windows = pcall(require, 'windows')
if not status_ok then
    return
end

windows.setup {}

vim.o.winwidth = 20
vim.o.winminwidth = 20
vim.o.equalalways = false

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<C-w>z', ':WindowsMaximize<CR>', opts)
keymap('n', '<C-w>_', ':WindowsMaximizeVertically<CR>', opts)
keymap('n', '<C-w>|', ':WindowsMaximizeHorizontally<CR>', opts)
keymap('n', '<C-w>=', ':WindowsEqualize<CR>', opts)

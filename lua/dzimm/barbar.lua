local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<S-h>', ':BufferPrevious<CR>', opts)
keymap('n', '<S-l>', ':BufferNext<CR>', opts)
keymap('n', '<A-,>', ':BufferMovePrevious<CR>', opts)
keymap('n', '<A-.>', ':BufferMoveNext<CR>', opts)
keymap('n', '<LEADER>bc', ':BufferClose<CR>', opts)
keymap('n', '<LEADER>bp', ':BufferPin<CR>', opts)
keymap('n', '<LEADER>ba', ':BufferCloseAllButCurrentOrPinned<CR>', opts)
keymap('n', '<LEADER>bk', ':BufferPick<CR>', opts)

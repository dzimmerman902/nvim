local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<LEADER>r', ':ReplaceWithRegisterOperator', opts)
keymap('n', '<LEADER>rr', ':ReplaceWithRegisterLine', opts)

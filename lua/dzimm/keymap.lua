-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('', '<SPACE>', '<Nop>', opts)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Write Buffer
keymap('n', '<LEADER>w', ':w<CR>', opts)

-- Exit Insert Mode
keymap('i', 'kj', '<ESC>', opts)
keymap('i', 'jk', '<ESC>', opts)

-- Switch Between Windows
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Switch Between Buffers
keymap('n', '<C-UP>', ':resize -4<CR>', opts)
keymap('n', '<C-DOWN>', ':resize +4<CR>', opts)
keymap('n', '<C-LEFT>', ':vertical resize +4<CR>', opts)
keymap('n', '<C-RIGHT>', ':vertical resize -4<CR>', opts)

-- Move Line Up/Down
keymap('n', '<M-j>', 'mz:m+<CR>`z', { silent = true })
keymap('n', '<M-k>', 'mz:m-2<CR>`z', { silent = true })

-- Clipboard Registry
keymap('n', '<LEADER>c', '"+', opts)

-- ???
keymap('v', 'p', '"_dP', opts)

-- Better Indents
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Replace with Registers

-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<LEADER>w', ':w', opts)
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
keymap('n', '<M-j>', 'mz:m+<cr>`z', { silent = true })
keymap('n', '<M-k>', 'mz:m-2<cr>`z', { silent = true })

-- Quit Nvim
keymap('n', '<LEADER>q', ':qa<CR>', opts)

-- ???
keymap('v', 'p', '"_dP', opts)

-- Better Indents
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Get from clipboar
keymap('n', "<S-'><S-=>", '<LEADER>c', opts)

-- Null LS
-- Format
keymap('n', '<LEADER>p', ':lua vim.lsp.buf.format({ async = true })<CR>', opts)

-- BarBar
keymap('n', '<S-h>', ':BufferPrevious<cr>', opts)
keymap('n', '<S-l>', ':BufferNext<cr>', opts)
keymap('n', '<A-c>', ':BufferClose<cr>', opts)

-- Replace with Registers
keymap("n", "<LEADER>r", "<Plug>ReplaceWithRegisterOperator", opts)
keymap("n", "<LEADER>rr", "<Plug>ReplaceWithRegisterLine", opts)

-- DAP
keymap('n', '<LEADER>dc', ':DapContinue<CR>', opts)
keymap('n', '<LEADER>dt', ':DapTerminate<CR>', opts)
keymap('n', '<LEADER>db', ':DapToggleBreakpoint<CR>', opts)
keymap('n', '<LEADER>db', ':DapToggleBreakpoint<CR>', opts)
keymap('n', '<LEADER>dr', ":lua require'dap'.repl.open()<CR>", opts)
keymap('n', '<LEADER>dl', ":lua require'dap'.run_last()<CR>", opts)
keymap('n', '<LEADER>di', ':DapStepInto<CR>', opts)
keymap('n', '<LEADER>do', ':DapStepOver<CR>', opts)
keymap('n', '<LEADER>de', ':DapStepOut<CR>', opts)

-- DAP UI
keymap('n', '<LEADER>dui', ":lua require('dapui').toggle()<CR>", opts)

-- FzfLua
keymap('n', '<LEADER>ff', ':FzfLua files<CR>', opts)
keymap('n', '<LEADER>fg', ':FzfLua grep<CR>', opts)

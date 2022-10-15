local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

keymap('n', '<leader>w', ':w', opts)
keymap('', '<Space>', '<Nop>', opts)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Write Buffer
keymap('n', '<leader>w', ':w<CR>', opts)

-- Exit Insert Mode
keymap('i', 'kj', '<Esc>', opts)
keymap('i', 'jk', '<Esc>', opts)

-- Switch Between Windows
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Switch Between Buffers

keymap('n', '<C-Up>', ':resize -4<CR>', opts)
keymap('n', '<C-Down>', ':resize +4<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize +4<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize -4<CR>', opts)

-- Move Line Up/Down
keymap('n', '<M-j>', 'mz:m+<cr>`z', { silent = true })
keymap('n', '<M-k>', 'mz:m-2<cr>`z', { silent = true })

-- Delete Buffers
keymap('n', '<leader>bd', ':bd<cr>', opts)

-- ???
keymap('v', 'p', '"_dP', opts)

-- Better Indents
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Get from clipboar
keymap('n', "<S-'><S-=>", '<LEADER>c', opts)

-- Null LS
-- Format
keymap('n', '<leader>p', ':lua vim.lsp.buf.format({ async = true })<cr>', opts)

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files hidden=true<cr>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<cr>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<cr>', opts)

-- Nvimtree
keymap('n', '<leader>ee', ':NvimTreeToggle<cr>', opts)
keymap('n', '<leader>ef', ':NvimTreeFocus<cr>', opts)
keymap('n', '<leader>ec', ':NvimTreeCollapse<cr>', opts)

-- BarBar
keymap('n', '<s-h>', ':BufferPrevious<cr>', opts)
keymap('n', '<s-l>', ':BufferNext<cr>', opts)
keymap('n', '<a-c>', ':BufferClose<cr>', opts)

-- Replace with Registers
-- keymap("n", "<leader>r", "<Plug>ReplaceWithRegisterOperator", opts)
-- keymap("n", "<leader>rr", "<Plug>ReplaceWithRegisterLine", opts)

-- DAP
keymap('n', '<leader>dc', ':DapContinue<CR>', opts)
keymap('n', '<leader>dt', ':DapTerminate<CR>', opts)
keymap('n', '<leader>db', ':DapToggleBreakpoint<CR>', opts)
keymap('n', '<leader>db', ':DapToggleBreakpoint<CR>', opts)
keymap('n', '<leader>dr', ":lua require'dap'.repl.open()<cr>", opts)
keymap('n', '<leader>dl', ":lua require'dap'.run_last()<cr>", opts)
keymap('n', '<leader>di', ':DapStepInto<CR>', opts)
keymap('n', '<leader>do', ':DapStepOver<CR>', opts)
keymap('n', '<leader>de', ':DapStepOut<CR>', opts)

-- DAP UI
keymap('n', '<leader>dui', ":lua require('dapui').toggle()<CR>", opts)

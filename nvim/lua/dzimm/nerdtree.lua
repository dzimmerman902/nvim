-- local status_ok, nerdtree = pcall(require, 'nerdtree')
-- if not status_ok then
--     return
-- end
--
-- nerdtree.setup {}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<LEADER>ee', ':NERDTreeToggle<CR>', opts)

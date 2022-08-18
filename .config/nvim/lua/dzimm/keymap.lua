local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

keymap("n", "<leader>w", ":w", opts)
keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>w", ":w<CR>", opts)

keymap("i", "kj", "<Esc>", opts)
keymap("i", "jk", "<Esc>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<M-j>", "mz:m+<cr>`z", { silent = true })
keymap("n", "<M-k>", "mz:m-2<cr>`z", { silent = true })

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Null LS
-- Format
keymap("n", "<leader>p", ":lua vim.lsp.buf.formatting_sync()<cr>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files<cr>", opts)
keymap("n", "<c-t>", ":Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>ee", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>ef", ":NvimTreeFocus<cr>", opts)

-- Buffline
keymap("n", "<C-w>", ":BufferLinePickClose<cr>", opts)

-- Replace with Registers
keymap("n", "<leader>r", "<Plug>ReplaceWithRegisterOperator", { noremap = true, silent = true })
keymap("n", "<leader>rr", "<Plug>ReplaceWithRegisterLine", { noremap = true, silent = true })

-- DAP
keymap("n", "<F5>", ":DapContinue<CR>", opts)
keymap("n", "<leader>F5", ":DapTerminate<CR>", opts)
keymap("n", "<F9>", ":DapToggleBreakpoint<CR>", opts)
keymap("n", "<F11>", ":DapStepInto<CR>", opts)
keymap("n", "<F10>", ":DapStepOver<CR>", opts)
keymap("n", "<leader>F11", ":DapStepOut<CR>", opts)

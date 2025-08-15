-- ============================================================================
-- Keymaps Configuration
-- ============================================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================================================
-- GENERAL KEYMAPS
-- ============================================================================

-- Clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- ============================================================================
-- WINDOW MANAGEMENT
-- ============================================================================
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window resizing (Mac-friendly, repeatable with .)
keymap("n", "<leader>rk", "<C-w>-", { desc = "Decrease window height" })
keymap("n", "<leader>rj", "<C-w>+", { desc = "Increase window height" })
keymap("n", "<leader>rh", "<C-w><", { desc = "Decrease window width" })
keymap("n", "<leader>rl", "<C-w>>", { desc = "Increase window width" })

-- ============================================================================
-- TAB MANAGEMENT
-- ============================================================================
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- ============================================================================
-- BUFFER MANAGEMENT
-- ============================================================================

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- ============================================================================
-- TEXT EDITING
-- ============================================================================

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Keep search terms in the middle
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- ============================================================================
-- INSERT MODE
-- ============================================================================

-- Exit insert mode with jk or kj
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Insert mode navigation
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- ============================================================================
-- FILE OPERATIONS
-- ============================================================================

-- Save file
keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
keymap("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "Save file and return to insert" })
keymap("v", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })

-- Force quit
keymap("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Force quit" })

-- ============================================================================
-- UI TOGGLES
-- ============================================================================

-- Toggle line wrapping
keymap("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrapping" })

-- Toggle relative line numbers
keymap("n", "<leader>ln", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative line numbers" })

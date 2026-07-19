-- ============================================================================
-- Keymaps Configuration
-- ============================================================================

local keymap = vim.keymap.set

-- ============================================================================
-- GENERAL KEYMAPS
-- ============================================================================

-- Clear search highlights
keymap("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- Delete single character without copying into register
keymap("n", "x", '"_x', { silent = true, desc = "Delete char without yanking" })

-- ============================================================================
-- WINDOW MANAGEMENT
-- ============================================================================
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap("n", "<leader>wd", "<C-w>q", { desc = "Delete/close current window" })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window resizing (Mac-friendly, repeatable with .)
keymap("n", "<C-Up>", "5<C-w>+", { desc = "Increase window height" })
keymap("n", "<C-Down>", "5<C-w>-", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "5<C-w><", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "5<C-w>>", { desc = "Increase window width" })

-- ============================================================================
-- TAB MANAGEMENT
-- ============================================================================
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<leader>tF", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- ============================================================================
-- BUFFER MANAGEMENT
-- ============================================================================

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", { silent = true, desc = "Next buffer" })
keymap("n", "<S-h>", "<cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })

-- Delete buffer but keep split window
keymap("n", "<leader>bd", "<cmd>enew | bdelete #<CR>", { desc = "Delete buffer, keep split" })

-- ============================================================================
-- TEXT EDITING
-- ============================================================================

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

-- Stay in indent mode
keymap("v", "<", "<gv", { silent = true, desc = "Indent left" })
keymap("v", ">", ">gv", { silent = true, desc = "Indent right" })

-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Scroll down centered" })
keymap("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Scroll up centered" })

-- Keep search terms in the middle
keymap("n", "n", "nzzzv", { silent = true, desc = "Next search result centered" })
keymap("n", "N", "Nzzzv", { silent = true, desc = "Prev search result centered" })

-- Better paste
keymap("v", "p", '"_dP', { silent = true, desc = "Paste without yanking selection" })

-- ============================================================================
-- INSERT MODE
-- ============================================================================

-- Exit insert mode with jk or kj
keymap("i", "jk", "<ESC>", { silent = true, desc = "Exit insert mode" })
keymap("i", "kj", "<ESC>", { silent = true, desc = "Exit insert mode" })

-- Insert mode navigation
keymap("i", "<C-h>", "<Left>", { silent = true, desc = "Move left" })
keymap("i", "<C-j>", "<Down>", { silent = true, desc = "Move down" })
keymap("i", "<C-k>", "<Up>", { silent = true, desc = "Move up" })
keymap("i", "<C-l>", "<Right>", { silent = true, desc = "Move right" })

-- ============================================================================
-- FILE OPERATIONS
-- ============================================================================

-- Save file
keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
keymap("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "Save file and return to insert" })
keymap("v", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })

-- Force quit
keymap("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Force quit" })

-- ============================================================================
-- UI TOGGLES
-- ============================================================================

-- Toggle line wrapping
keymap("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrapping" })

-- Toggle relative line numbers
keymap("n", "<leader>ln", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative line numbers" })

-- ============================================================================
-- TERMINAL
-- ============================================================================

-- Exit terminal mode
keymap("t", "<esc><esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Window navigation from terminal mode (e.g. Claude chat)
keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left window" })
keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to bottom window" })
keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to top window" })
keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right window" })

-- ============================================================================
-- LSP DIAGNOSTICS
-- ============================================================================

-- Show diagnostics in floating window
keymap("n", "<leader>of", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- Navigate diagnostics
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Show all diagnostics in quickfix list
keymap("n", "<leader>ol", vim.diagnostic.setqflist, { desc = "Open diagnostics quickfix list" })

-- Reveal file in Finder (macOS)
keymap("n", "<leader>rf", "<cmd>!open -R %<CR>", { desc = "Reveal file in Finder" })

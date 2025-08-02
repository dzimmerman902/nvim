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

-- Buffer operations
keymap("n", "<leader>bd", function()
	local buf_count = #vim.fn.getbufinfo({ buflisted = 1 })
	if buf_count > 1 then
		vim.cmd("bprevious")
	else
		vim.cmd("enew")
	end
	vim.cmd("bdelete #")
end, { desc = "Delete buffer (keep window)" })
keymap("n", "<leader>ba", "<cmd>%bd|e#<CR>", { desc = "Delete all buffers except current" })

-- ============================================================================
-- TEXT EDITING
-- ============================================================================

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Only set wrapped navigation for j/k in non-terminal buffers
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
	pattern = "*",
	callback = function()
		-- More robust terminal detection
		local is_terminal = vim.bo.buftype == "terminal"
		local is_lazygit = vim.fn.expand("%"):match("lazygit") ~= nil

		-- Only apply wrapped navigation to regular text files
		if not is_terminal and not is_lazygit and vim.bo.filetype ~= "" then
			keymap("n", "j", "gj", { buffer = true, noremap = true, silent = true })
			keymap("n", "k", "gk", { buffer = true, noremap = true, silent = true })
			keymap("v", "j", "gj", { buffer = true, noremap = true, silent = true })
			keymap("v", "k", "gk", { buffer = true, noremap = true, silent = true })
		end
	end,
})

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

-- Quick quit
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Force quit
keymap("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force quit" })

-- Save and quit (using Ctrl+s paradigm)
keymap("n", "<C-s><C-q>", "<cmd>wq<CR>", { desc = "Save and quit" })

-- New file
keymap("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New file" })

-- ============================================================================
-- TERMINAL
-- ============================================================================

-- Quarter-size terminal at bottom (like VSCode)
keymap("n", "<leader>tt", function()
	vim.cmd("split")
	vim.cmd("resize " .. math.floor(vim.o.lines * 0.25))
	vim.cmd("terminal")
end, { desc = "Open quarter-size terminal at bottom" })

-- Full-window terminal
keymap("n", "<leader>tT", "<cmd>terminal<CR>", { desc = "Open full-window terminal" })

-- Better terminal navigation (excluding LazyGit)
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		local is_lazygit = vim.fn.expand("%"):match("lazygit") ~= nil
		if not is_lazygit then
			keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { buffer = true, noremap = true, silent = true })
			keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { buffer = true, noremap = true, silent = true })
			keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { buffer = true, noremap = true, silent = true })
			keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { buffer = true, noremap = true, silent = true })
		end
	end,
})

-- ============================================================================
-- UI TOGGLES
-- ============================================================================

-- Toggle line wrapping
keymap("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrapping" })

-- Toggle relative line numbers
keymap("n", "<leader>ln", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative line numbers" })

-- ============================================================================
-- LSP & DIAGNOSTICS
-- ============================================================================

-- Note: Most LSP and diagnostic keymaps are configured in lua/plugins/lsp.lua
-- Only keeping non-conflicting global diagnostic keymaps here
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- Removed <leader>df and <leader>dl to avoid conflicts with LSP config

-- ============================================================================
-- FILE EXPLORER
-- ============================================================================

-- Note: Neo-tree keymaps are configured in lua/plugins/neo-tree.lua
-- Removed duplicate <leader>e keymap to avoid conflicts



-- ============================================================================
-- DEBUGGING
-- ============================================================================

-- Debug keymaps (F-keys for quick access)
keymap("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debug: Start/Continue" })
keymap("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "Debug: Step Over" })
keymap("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Debug: Step Into" })
keymap("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "Debug: Step Out" })

-- ============================================================================
-- Neovim Options Configuration
-- ============================================================================

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Consider string-string as whole word
opt.iskeyword:append("-")

-- Disable swapfile
opt.swapfile = false

-- Backup
opt.backup = false
opt.writebackup = false

-- Shorter updatetime
opt.updatetime = 300

-- Don't show mode since we have statusline
opt.showmode = false

-- Better completion experience
opt.completeopt = "menu,menuone,noselect"

-- Minimum number of screen lines to keep above and below the cursor
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Better display for messages
opt.cmdheight = 1

-- Hide * markup for bold and italic (but show code block delimiters)
opt.conceallevel = 1

-- Global statusline
opt.laststatus = 3

-- Show which line your cursor is on
opt.ruler = true

-- Minimal number of columns to use for the line number
opt.numberwidth = 4

-- Enable mouse support
opt.mouse = "a"

-- Time in milliseconds to wait for a mapped sequence to complete
opt.timeoutlen = 300

-- Enable persistent undo
opt.undofile = true

-- Better diff options
opt.diffopt:append("vertical")

-- Wildmenu
opt.wildmenu = true
opt.wildmode = "longest:full,full"

-- Don't auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Auto resize panes when resizing nvim window
vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

-- Show code block delimiters in markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- Show quotes in JSON files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- Disable unused providers to reduce warnings
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

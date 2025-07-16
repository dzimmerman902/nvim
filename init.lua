-- ============================================================================
-- Neovim Configuration
-- ============================================================================

-- Set leader key early (must be set before lazy.nvim)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration modules
require("config.options")
require("config.keymaps")

-- Setup lazy.nvim and load plugins
require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})

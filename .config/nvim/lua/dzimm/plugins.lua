local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
    -- Packer
	use("wbthomason/packer.nvim")

	-- Airline
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")

	-- Alpha
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-- Auto Pairs
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	-- Buffline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- Comments
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Color Schemes
	use({ "catppuccin/nvim", as = "catppuccin" })
	-- use("morhetz/gruvbox")
	-- use("KeitaNakamura/neodark.vim")
	-- use("arcticicestudio/nord-vim")
	-- use("EdenEast/nightfox.nvim")
	-- use("joshdick/onedark.vim")
	-- use("mhartington/oceanic-next")

	-- Cmp Plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- Dadbod
	use("tpope/vim-dadbod")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Nvim Tree
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- Replace With Register
	use("vim-scripts/ReplaceWithRegister")

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Surround
	use("tpope/vim-surround")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- Toggleterm
	use("akinsho/toggleterm.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

return {
	-- {
	-- 	"jacoborus/tender.vim",
	-- 	lazy = false,
	-- 	priority = 1000,
	--    config = function()
	-- 		vim.cmd([[colorscheme tender]])
	-- 	end,
	-- },
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	-- 	name = "moonfly",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme moonfly]])
	-- 	end,
	-- },
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = { transparent = true },
			})
			vim.cmd([[colorscheme nordfox]])
		end,
	},
}

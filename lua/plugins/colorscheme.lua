return {
	{
		"jacoborus/tender.vim",
		lazy = false,
		priority = 1000,
    config = function()
			vim.cmd([[colorscheme tender]])
		end,
	},
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	-- 	name = "moonfly",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme moonfly]])
	-- 	end,
	-- },
}

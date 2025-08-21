return {
	{
		"ellisonleao/dotenv.nvim",
		lazy = false, -- ensures it loads at startup
		priority = 1000, -- run before other plugins
		config = function()
			require("dotenv").setup({
				enable_on_load = true,
			})
		end,
	},
}

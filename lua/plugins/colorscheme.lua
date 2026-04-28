return {
	-- Galaxy colorscheme (requires ColorV)
	{
		"gu-fan/galaxy.vim",
		dependencies = { "gu-fan/colorv.vim" },
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("galaxy")
		end,
	},

	-- Tokyo Night (kept as an optional alternative, disabled by default)
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 900,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}

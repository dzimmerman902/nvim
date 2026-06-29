return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{ "]]", function() Snacks.words.jump(1, true) end, desc = "Next word reference" },
			{ "[[", function() Snacks.words.jump(-1, true) end, desc = "Prev word reference" },
		},
		opts = {
			notifier = {
				enabled = true,
				timeout = 3000,
				style = "fancy",
			},
			input = {
				enabled = true,
			},
			scroll = {
				enabled = true,
			},
			words = {
				enabled = true,
			},
		},
	},
}

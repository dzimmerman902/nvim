return {
	-- In-editor markdown rendering
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "markdown" },
		keys = {
			{ "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", ft = "markdown", desc = "Toggle render markdown" },
		},
		opts = {
			enabled = false, -- start disabled, toggle with <leader>mr
		},
	},

	-- Browser markdown preview (requires deno)
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		ft = { "markdown" },
		keys = {
			{
				"<leader>mb",
				function()
					local peek = require("peek")
					if peek.is_open() then
						peek.close()
					else
						peek.open()
					end
				end,
				ft = "markdown",
				desc = "Toggle browser markdown preview",
			},
		},
		opts = {
			auto_load = false,
			theme = "dark",
			app = "google chrome",
		},
	},
}

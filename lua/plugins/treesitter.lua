return {
	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
					-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
					additional_vim_regex_highlighting = { "ruby" },
				},
				indent = { enable = true },
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"vimdoc",
					"c",
					"rust",
					"python",
					"go",
					"java",
					"php",
					"ruby",
					"sql",
					"toml",
				},
			})
		end,
	},
}


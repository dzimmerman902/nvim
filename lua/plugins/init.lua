-- ============================================================================
-- Plugin Specifications
-- ============================================================================

return {
	-- Essential plugins that don't need much configuration
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use

	-- Better vim.ui
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Enhanced commenting with "gc" to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				-- Add a space b/w comment and the line
				padding = true,
				-- Whether the cursor should stay at its position
				sticky = true,
				-- Lines to be ignored while (un)comment
				ignore = nil,
				-- LHS of toggle mappings in NORMAL mode
				toggler = {
					line = "gcc", -- Line-comment toggle keymap
					block = "gbc", -- Block-comment toggle keymap
				},
				-- LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = {
					line = "gc", -- Line-comment keymap
					block = "gb", -- Block-comment keymap
				},
				-- LHS of extra mappings
				extra = {
					above = "gcO", -- Add comment on the line above
					below = "gco", -- Add comment on the line below
					eol = "gcA", -- Add comment at the end of line
				},
				-- Enable keybindings
				mappings = {
					basic = true,
					extra = true,
				},
				-- Function to call before (un)comment
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				-- Function to call after (un)comment
				post_hook = nil,
			})
		end,
	},

	-- Context-aware commenting for embedded languages (JSX, Vue, etc.)
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},

	-- Add/change/delete surrounding delimiter pairs with ease
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Better escape
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		opts = {
			timeout = vim.o.timeoutlen,
			default_mappings = true,
			mappings = {
				i = {
					j = {
						k = "<Esc>",
						j = "<Esc>",
					},
				},
				c = {
					j = {
						k = "<Esc>",
						j = "<Esc>",
					},
				},
				t = {
					j = {
						k = "<Esc>",
						j = "<Esc>",
					},
				},
				v = {
					j = {
						k = "<Esc>",
					},
				},
				s = {
					j = {
						k = "<Esc>",
					},
				},
			},
		},
	},
}

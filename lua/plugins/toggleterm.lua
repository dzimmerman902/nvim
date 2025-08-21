return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})
		end,
		keys = {
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
			{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal terminal" },
			{ "<leader>tv", "<cmd>ToggleTerm size=60 direction=vertical<cr>", desc = "Vertical terminal" },
			{ "<leader>ts", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send current line" },
		},
	},
}

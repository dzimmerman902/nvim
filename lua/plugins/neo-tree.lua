return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle current<CR>", desc = "Toggle file explorer" },
			{ "<leader>E", "<cmd>Neotree reveal<CR>", desc = "Reveal current file in explorer" },
		},
		opts = {
			window = {
				width = 35,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				filtered_items = {
					visible = false, -- hidden by default, toggle with H
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		},
	},
}

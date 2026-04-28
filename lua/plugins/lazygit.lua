return {
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
				{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
				{ "<leader>gF", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit current file" },
		},
		config = function()
			-- Configure lazygit to open files in the current nvim instance
			vim.g.lazygit_floating_window_scaling_factor = 0.9
			vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
			vim.g.lazygit_use_neovim_remote = 1 -- Use neovim remote to open files
		end,
	},
}

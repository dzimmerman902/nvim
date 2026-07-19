return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			telescope.load_extension("fzf")
		end,
		keys = function()
			local builtin = require("telescope.builtin")

			return {
				{ "<leader>sH", builtin.help_tags, desc = "Search help tags" },
				{ "<leader>sk", builtin.keymaps, desc = "Search keymaps" },
				{ "<leader>sf", builtin.find_files, desc = "Search files" },
				{
					"<leader>sF",
					function()
						builtin.find_files({ hidden = true, no_ignore = true })
					end,
					desc = "Search files (all/hidden)",
				},
				{ "<leader>ss", builtin.builtin, desc = "Search telescope pickers" },
				{ "<leader>sw", builtin.grep_string, desc = "Search current word" },
				{ "<leader>sg", builtin.live_grep, desc = "Search by grep" },
				{ "<leader>sd", builtin.diagnostics, desc = "Search diagnostics" },
				{ "<leader>sr", builtin.resume, desc = "Search resume" },
				{ "<leader>s.", builtin.oldfiles, desc = "Search recent files" },
				{ "<leader><leader>", builtin.find_files, desc = "Find files" },
				{ "<leader>gs", builtin.git_status, desc = "Git status" },
			}
		end,
	},
}

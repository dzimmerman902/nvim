return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = function(_, keys)
			local builtin = require("telescope.builtin")

			return {
				{ "<leader>sH", builtin.help_tags, desc = "[S]earch [H]elp", mode = "n" },
				{ "<leader>sk", builtin.keymaps, desc = "[S]earch [K]eymaps", mode = "n" },
				{ "<leader>sf", builtin.find_files, desc = "[S]earch [F]iles", mode = "n" },
				{ "<leader>ss", builtin.builtin, desc = "[S]earch [S]elect Telescope", mode = "n" },
				{ "<leader>sw", builtin.grep_string, desc = "[S]earch current [W]ord", mode = "n" },
				{ "<leader>sg", builtin.live_grep, desc = "[S]earch by [G]rep", mode = "n" },
				{ "<leader>sd", builtin.diagnostics, desc = "[S]earch [D]iagnostics", mode = "n" },
				{ "<leader>sr", builtin.resume, desc = "[S]earch [R]esume", mode = "n" },
				{ "<leader>s.", builtin.oldfiles, desc = '[S]earch Recent Files ("." for repeat)', mode = "n" },
				{ "<leader><leader>", builtin.find_files, desc = "[ ] Find files in directory", mode = "n" },
			}
		end,
		config = function() end,
	},
}

-- ============================================================================
-- Which-key Configuration
-- ============================================================================

return {
	-- Show keybindings in popup
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			
			wk.setup({
				preset = "modern",
				delay = 500, -- delay before showing which-key
				plugins = {
					marks = true,
					registers = true,
					spelling = {
						enabled = true,
						suggestions = 20,
					},
				},
				win = {
					border = "rounded",
					padding = { 1, 2 },
				},
			})

			-- Register key groups for better organization
			wk.add({
				{ "<leader>b", group = "Buffer" },
				{ "<leader>d", group = "Debug/Diagnostics" },
				{ "<leader>f", group = "Format" },
				{ "<leader>g", group = "Git" },
				{ "<leader>h", group = "Git Hunks" },
				{ "<leader>l", group = "LSP/UI" },
				{ "<leader>r", group = "Resize/Rename" },
				{ "<leader>s", group = "Search" },
				{ "<leader>t", group = "Terminal/Tabs/Toggle" },
				{ "<leader>w", group = "Window" }, -- Reserved for window commands
			})
		end,
	},
}

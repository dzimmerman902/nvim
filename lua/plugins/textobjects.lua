-- ============================================================================
-- Text Objects Configuration
-- ============================================================================

return {
	-- Additional text objects for enhanced editing
	{
		"chrisgrieser/nvim-various-textobjs",
		event = "VeryLazy",
		config = function()
			require("various-textobjs").setup({
				-- Use suggested keymaps
				useDefaultKeymaps = true,
				-- Disable some conflicting keymaps
				disabledKeymaps = { "gc" }, -- conflicts with comment plugin
			})
		end,
	},
}

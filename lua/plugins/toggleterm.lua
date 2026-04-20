return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
			})
		end,
	},
}

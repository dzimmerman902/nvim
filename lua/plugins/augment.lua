return {
	{
		"augmentcode/augment.vim",
		config = function()
			vim.g.augment_workspace_folders = {
				vim.fn.getcwd(),
			}

			local ns_id = vim.api.nvim_create_namespace("augment_inline")

			vim.api.nvim_create_autocmd("InsertLeave", {
				desc = "Clear Augment inline suggestions",
				callback = function()
					vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
				end,
			})

			vim.cmd("Augment status")
		end,
		keys = {
			{ "<leader>ac", ":Augment chat<CR>", mode = { "n", "v" }, desc = "Augment Chat" },
			{ "<leader>an", ":Augment chat-new<CR>", mode = { "n", "v" }, desc = "Augment Chat New" },
			{ "<leader>at", ":Augment chat-toggle<CR>", mode = { "n", "v" }, desc = "Augment Chat Toggle" },
			{ "<leader>as", ":Augment status<CR>", mode = { "n", "v" }, desc = "Augment Status" },
		},
	},
}

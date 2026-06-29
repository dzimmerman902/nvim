local vue_ls_path = vim.fn.trim(vim.fn.system("npm root -g")) .. "/@vue/language-server"

return {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_ls_path,
				languages = { "vue" },
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

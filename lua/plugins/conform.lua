local prettier_fts = {
	"javascript", "typescript", "javascriptreact", "typescriptreact",
	"svelte", "css", "html", "vue", "json", "yaml", "markdown",
	"graphql", "liquid",
}

local formatters_by_ft = {
	lua      = { "stylua" },
	python   = { "isort", "black" },
	terraform = { "terraform_fmt" },
	sql      = { "sqlfluff" },
	xml      = { "xmlformatter" },
}

for _, ft in ipairs(prettier_fts) do
	formatters_by_ft[ft] = { "prettier" }
end

return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>f",
				function()
					local conform = require("conform")
					local formatters = conform.list_formatters()
					local available = vim.tbl_filter(function(f) return f.available end, formatters)

					if #available == 0 then
						vim.notify("No formatter available for filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
						return
					end

					conform.format({
						lsp_format = "fallback",
						async = false,
						timeout_ms = 1000,
					})
				end,
				mode = { "n", "v" },
				desc = "Format file or range",
			},
		},
		config = function()
			require("conform").setup({
				notify_on_error = true,
				formatters_by_ft = formatters_by_ft,
			})
		end,
	},
}

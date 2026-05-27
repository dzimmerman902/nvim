return {
	{ "mason-org/mason.nvim", tag = "v2.2.1", pin = true },
	{ "mason-org/mason-lspconfig.nvim", tag = "v2.2.0", pin = true },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{
		"neovim/nvim-lspconfig",
		tag = "v2.8.0",
		pin = true,
		config = function()
			-- Default capabilities for all servers
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				end,
			})

			-- sourcekit is a system tool, not mason-managed
			require("lspconfig").sourcekit.setup({
				cmd = { "sourcekit-lsp" },
				filetypes = { "swift", "objective-c", "objective-cpp" },
				root_markers = {
					".git",
					"compile_commands.json",
					".sourcekit-lsp",
					"Package.swift",
				},
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
					textDocument = {
						diagnostic = {
							dynamicRegistration = true,
							relatedDocumentSupport = true,
						},
					},
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						runtime = { version = "LuaJIT" },
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.config("vue_ls", {
				filetypes = { "vue" },
				init_options = {
					vue = { hybridMode = true },
				},
			})

			vim.lsp.config("ts_ls", {
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vim.fn.stdpath("data")
								.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
							languages = { "vue" },
						},
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})

			require("mason").setup({})
			require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer" },
			})
			vim.lsp.enable({ "lua_ls", "rust_analyzer", "vue_ls", "ts_ls" })
		end,
	},
}

-- ============================================================================
-- LSP Configuration
-- ============================================================================

return {
	-- Mason: Portable package manager for Neovim
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	-- Mason LSP Config: Bridge between mason and lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"pyright",
					"ts_ls",
					"html",
					"cssls",
					"tailwindcss",
					"jsonls",
					"yamlls",
					"bashls",
				},
				automatic_installation = true,
			})
		end,
	},

	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local keymap = vim.keymap.set

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings
					local opts = { buffer = ev.buf, silent = true }

					-- Set keybinds
					opts.desc = "Show LSP references"
					keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

					opts.desc = "Go to declaration"
					keymap("n", "gD", vim.lsp.buf.declaration, opts)

					opts.desc = "Show LSP definitions"
					keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

					opts.desc = "Show LSP implementations"
					keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

					opts.desc = "Show LSP type definitions"
					keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

					opts.desc = "See available code actions"
					keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					opts.desc = "Smart rename"
					keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

					opts.desc = "Show buffer diagnostics"
					keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

					opts.desc = "Show line diagnostics"
					keymap("n", "<leader>d", vim.diagnostic.open_float, opts)

					opts.desc = "Go to previous diagnostic"
					keymap("n", "[d", vim.diagnostic.goto_prev, opts)

					opts.desc = "Go to next diagnostic"
					keymap("n", "]d", vim.diagnostic.goto_next, opts)

					opts.desc = "Show documentation for what is under cursor"
					keymap("n", "K", vim.lsp.buf.hover, opts)

					opts.desc = "Restart LSP"
					keymap("n", "<leader>rs", ":LspRestart<CR>", opts)
				end,
			})

			-- Used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Configure diagnostic signs using the new API
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})

			-- Setup LSP servers after a delay to ensure mason-lspconfig is ready
			vim.defer_fn(function()
				local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

				if mason_lspconfig_ok and mason_lspconfig.setup_handlers then
					mason_lspconfig.setup_handlers({
						-- Default handler for installed servers
						function(server_name)
							lspconfig[server_name].setup({
								capabilities = capabilities,
							})
						end,
						["lua_ls"] = function()
							lspconfig["lua_ls"].setup({
								capabilities = capabilities,
								settings = {
									Lua = {
										-- Make the language server recognize "vim" global
										diagnostics = {
											globals = { "vim" },
										},
										completion = {
											callSnippet = "Replace",
										},
									},
								},
							})
						end,
					})
				else
					-- Fallback: manually setup common LSP servers
					local servers = {
						"lua_ls",
						"rust_analyzer",
						"pyright",
						"ts_ls",
						"html",
						"cssls",
						"tailwindcss",
						"jsonls",
						"yamlls",
						"bashls",
					}

					for _, server in ipairs(servers) do
						if server == "lua_ls" then
							lspconfig[server].setup({
								capabilities = capabilities,
								settings = {
									Lua = {
										diagnostics = {
											globals = { "vim" },
										},
										completion = {
											callSnippet = "Replace",
										},
									},
								},
							})
						else
							lspconfig[server].setup({
								capabilities = capabilities,
							})
						end
					end
				end
			end, 200) -- 200ms delay
		end,
	},
}

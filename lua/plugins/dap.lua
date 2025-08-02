-- ============================================================================
-- Debug Adapter Protocol (DAP) Configuration
-- ============================================================================

return {
	-- Core DAP plugin
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Creates a beautiful debugger UI
			"rcarriga/nvim-dap-ui",

			-- Required dependency for nvim-dap-ui
			"nvim-neotest/nvim-nio",

			-- Installs the debug adapters for you
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",

			-- Add your own debuggers here
			"leoluz/nvim-dap-go",
		},
		keys = function(_, keys)
			local dap = require("dap")
			local dapui = require("dapui")
			return {
				-- Basic debugging keymaps
				{
					"<leader>dB",
					function()
						dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
					end,
					desc = "Breakpoint Condition",
				},
				{ "<leader>db", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
				{ "<leader>dc", dap.continue, desc = "Continue" },
				{
					"<leader>da",
					function()
						dap.continue({ before = get_args })
					end,
					desc = "Run with Args",
				},
				{ "<leader>dC", dap.run_to_cursor, desc = "Run to Cursor" },
				{ "<leader>dg", dap.goto_, desc = "Go to line (no execute)" },
				{ "<leader>di", dap.step_into, desc = "Step Into" },
				{ "<leader>dj", dap.down, desc = "Down" },
				{ "<leader>dk", dap.up, desc = "Up" },
				{ "<leader>dl", dap.run_last, desc = "Run Last" },
				{ "<leader>do", dap.step_over, desc = "Step Over" },
				{ "<leader>dO", dap.step_out, desc = "Step Out" },
				{ "<leader>dp", dap.pause, desc = "Pause" },
				{ "<leader>dr", dap.repl.toggle, desc = "Toggle REPL" },
				{ "<leader>ds", dap.session, desc = "Session" },
				{
					"<leader>dt",
					function()
						-- Force terminate with timeout
						dap.terminate()
						-- If termination takes too long, force close
						vim.defer_fn(function()
							if dap.session() then
								dap.close()
								dapui.close()
							end
						end, 2000) -- 2 second timeout
					end,
					desc = "Terminate (with timeout)"
				},
				{
					"<leader>dT",
					function()
						-- Emergency force quit - immediately close everything
						dap.close()
						dapui.close()
						-- Kill any remaining debug processes
						vim.cmd("silent! !pkill -f js-debug")
					end,
					desc = "Force terminate (emergency)"
				},
				{ "<leader>dw", require("dap.ui.widgets").hover, desc = "Widgets" },

				-- DAP UI keymaps
				{ "<leader>du", dapui.toggle, desc = "Dap UI" },
				{ "<leader>de", dapui.eval, desc = "Eval", mode = { "n", "v" } },
				{
					"<leader>dR",
					function()
						dapui.close()
						dapui.open()
					end,
					desc = "Reset DAP UI Layout",
				},
			}
		end,
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = true,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				-- You'll need to check that you have the required things installed
				-- online, please don't ask me how to install them :)
				ensure_installed = {
					-- Update this to ensure that you have the debuggers for the langs you want
					"js-debug-adapter",
				},
			})

			-- Simple JavaScript/TypeScript debugging setup
			-- This will work once js-debug-adapter is installed via Mason
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
				-- Add timeout settings for faster termination
				options = {
					initialize_timeout_sec = 5,
					disconnect_timeout_sec = 2,
				},
			}

			dap.configurations.javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Test",
					program = "${workspaceFolder}/__tests__/index.js",
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}

			dap.configurations.typescript = dap.configurations.javascript

			-- Dap UI setup
			-- For more information, see |:help nvim-dap-ui|
			dapui.setup({
				-- Set icons to characters that are more likely to work in every terminal.
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
				-- Configure element behavior
				element_mappings = {
					-- In the scopes window
					scopes = {
						expand = { "<CR>", "<2-LeftMouse>" },
						open = "o",
						remove = "d",
						edit = "e",
						repl = "r",
						toggle = "t",
					},
					-- In the stacks window
					stacks = {
						open = "<CR>",
						expand = "o",
					},
				},
				-- Expand/collapse settings
				expand_lines = true, -- Allow text to bleed over past window width
				layouts = {
					{
						elements = {
							-- Customize which elements to show and their order
							{ id = "scopes", size = 0.25 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							"repl",
							"console",
						},
						size = 0.25,
						position = "bottom",
					},
				},
			})

			-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
			vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

			-- DAP event listeners for UI management
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			-- Improved termination handling
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
				-- Clear any lingering processes
				vim.defer_fn(function()
					if dap.session() then
						dap.close()
					end
				end, 500)
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
				-- Ensure clean exit
				vim.defer_fn(function()
					if dap.session() then
						dap.close()
					end
				end, 500)
			end

			-- Install golang specific config
			require("dap-go").setup()
		end,
	},

	-- Virtual text for the debugger (disabled - shows grayed values inline)
	-- {
	-- 	"theHamsta/nvim-dap-virtual-text",
	-- 	opts = {},
	-- },

	-- Mason integration for DAP
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			handlers = {},
		},
	},
}

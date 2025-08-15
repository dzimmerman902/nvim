return {
	-- Core DAP plugin
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"leoluz/nvim-dap-go",
		},
		keys = function(_, keys)
			local dap = require("dap")
			local dapui = require("dapui")

			return {
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
					dap.terminate,
					desc = "Terminate",
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
				automatic_installation = true,
				handlers = {},
				ensure_installed = {
					"js-debug-adapter",
				},
			})

			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
			}

			dap.configurations.javascript = {
				{
					name = "__tests__/index.js",
					type = "node2",
					request = "launch",
					program = "${workspaceFolder}/__tests__/index.js",
					cwd = "${workspaceFolder}",
          sourceMaps = true,
          protocal = 'inspector',
					console = "integratedTerminal",
				},
				{
					type = "node2",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "node2",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}

			dap.configurations.typescript = dap.configurations.javascript

			dapui.setup({
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
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			handlers = {},
		},
	},
}

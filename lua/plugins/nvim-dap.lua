local dapui_config = {
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
	element_mappings = {
		scopes = {
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		stacks = {
			open = "<CR>",
			expand = "o",
		},
	},
	expand_lines = true,
	layouts = {
		{
			elements = {
				{ id = "scopes",      size = 0.25 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks",      size = 0.25 },
				{ id = "watches",     size = 0.25 },
			},
			size = 40,
			position = "left",
		},
		{
			elements = { "repl", "console" },
			size = 0.25,
			position = "bottom",
		},
	},
}

local function get_args(config)
	local args = vim.split(vim.fn.input("Args: "), " ")
	config = vim.deepcopy(config)
	config.args = args
	return config
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
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
				{ "<leader>db", dap.toggle_breakpoint,              desc = "Toggle Breakpoint" },
				{ "<leader>dc", dap.continue,                        desc = "Continue" },
				{
					"<leader>da",
					function()
						dap.continue({ before = get_args })
					end,
					desc = "Run with Args",
				},
				{ "<leader>dC", dap.run_to_cursor,                   desc = "Run to Cursor" },
				{ "<leader>dg", dap.goto_,                           desc = "Go to line (no execute)" },
				{ "<leader>di", dap.step_into,                       desc = "Step Into" },
				{ "<leader>dj", dap.down,                            desc = "Down" },
				{ "<leader>dk", dap.up,                              desc = "Up" },
				{ "<leader>dl", dap.run_last,                        desc = "Run Last" },
				{ "<leader>do", dap.step_over,                       desc = "Step Over" },
				{ "<leader>dO", dap.step_out,                        desc = "Step Out" },
				{ "<leader>dp", dap.pause,                           desc = "Pause" },
				{ "<leader>dr", dap.repl.toggle,                     desc = "Toggle REPL" },
				{ "<leader>ds", dap.session,                         desc = "Session" },
				{ "<leader>dt", dap.terminate,                       desc = "Terminate" },
				{ "<leader>dw", require("dap.ui.widgets").hover,     desc = "Widgets" },
				{ "<leader>du", dapui.toggle,                        desc = "DAP UI" },
				{ "<leader>de", dapui.eval,                          desc = "Eval", mode = { "n", "v" } },
				{ "<F7>",       dapui.toggle,                        desc = "DAP UI" },
				{
					"<leader>dR",
					function()
						dapui.close()
						dapui.setup(dapui_config)
						dapui.open()
					end,
					desc = "Reset DAP UI Layout",
				},
			}
		end,
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup(dapui_config)

			-- Load adapter configs from lua/dap/
			require("dap.node")
			require("dap.lua")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}

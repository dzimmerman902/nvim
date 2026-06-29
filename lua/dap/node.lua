local dap = require("dap")
local js_debug_path = vim.fn.expand("~/.local/share/nvim/dap/vscode-js-debug/dist/src/dapDebugServer.js")

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		args = { js_debug_path, "${port}" },
	},
	options = {
		initialize_timeout_sec = 10,
	},
}

local config = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch test",
		program = "${workspaceFolder}/__tests__/index.js",
		cwd = "${workspaceFolder}",
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		type = "pwa-node",
		request = "attach",
		name = "Attach",
		processId = require("dap.utils").pick_process,
		cwd = "${workspaceFolder}",
	},
}

dap.configurations.javascript = config
dap.configurations.typescript = config
dap.configurations.javascriptreact = config
dap.configurations.typescriptreact = config

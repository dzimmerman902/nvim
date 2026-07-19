local dap = require("dap")
local lua_debugger_path = vim.fn.expand("~/.local/share/nvim/dap/local-lua-debugger-vscode")

dap.adapters["local-lua"] = {
	type = "executable",
	command = "node",
	args = { lua_debugger_path .. "/extension/debugAdapter.js" },
	enrich_config = function(config, on_config)
		if not config.extensionPath then
			config = vim.deepcopy(config)
			config.extensionPath = lua_debugger_path
		end
		on_config(config)
	end,
}

dap.configurations.lua = {
	{
		type = "local-lua",
		request = "launch",
		name = "Debug Lua file",
		cwd = "${workspaceFolder}",
		program = { lua = "lua", file = "${file}" },
		args = {},
	},
	{
		type = "local-lua",
		request = "launch",
		name = "Debug LOVE2D project",
		cwd = "${workspaceFolder}",
		program = { command = "love" },
		args = { "${workspaceFolder}" },
	},
}

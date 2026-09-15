return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "describe", "it", "before_each", "after_each", "before_all", "after_all", "assert" },
				disable = { "lowercase-global" },
			},
			runtime = { version = "LuaJIT" },
			telemetry = { enable = false },
			workspace = {
				library = {
					vim.fn.expand("~/.luarocks/share/lua/5.1"),
				},
				checkThirdParty = "Disable",
			},
			completion = {
				autoRequire = true,
				displayContext = 2,
			},
			hint = {
				enable = true,
				setType = true,
				paramType = true,
				await = true,
				semicolon = "Disable",
			},
			type = {
				castNumberToInteger = true,
			},
		},
	},
}

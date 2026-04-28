local M = {}

--- Get environment variable value from os.getenv() or .env file
--- @param var_name string The name of the environment variable to retrieve
--- @param env_file_path string|nil Optional path to .env file (defaults to .env in current working directory)
--- @return string|nil The value of the environment variable, or nil if not found
function M.get_env_var(var_name, env_file_path)
	-- Try to get from environment first
	local value = os.getenv(var_name)
	if value then
		return value
	end

	-- Fallback to reading from .env file
	if not env_file_path then
		-- Find workspace root by looking for common project markers
		local current_file = vim.api.nvim_buf_get_name(0)
		local current_dir = vim.fn.fnamemodify(current_file, ":h")

		-- Look for project root markers
		local root_markers = { ".git", ".gitignore", "package.json", "Cargo.toml", "go.mod", "pyproject.toml" }
		local root_dir = vim.fs.find(root_markers, {
			path = current_dir,
			upward = true,
		})[1]

		if root_dir then
			env_file_path = vim.fn.fnamemodify(root_dir, ":h") .. "/.env"
		else
			-- Fallback to current working directory
			env_file_path = vim.fn.getcwd() .. "/.env"
		end
	end

	if vim.fn.filereadable(env_file_path) == 1 then
		local lines = vim.fn.readfile(env_file_path)
		for _, line in ipairs(lines) do
			-- Match lines in format: KEY=VALUE
			local key, val = line:match("^([^=]+)=(.*)$")
			if key and val and key == var_name then
				return val
			end
		end
	end

	return nil
end

return M

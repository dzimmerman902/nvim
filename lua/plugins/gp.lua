return {
	{
		"robitx/gp.nvim",
		dependencies = { "ellisonleao/dotenv.nvim" },
		config = function()
			local utils = require("utils")

			-- Get API key using utility function
			local api_key = utils.get_env_var("ANTHROPIC_API_KEY")

			if api_key then
				print("✓ ANTHROPIC_API_KEY found, length:", string.len(api_key))
			else
				print("✗ ANTHROPIC_API_KEY not found in environment or .env file")
			end

			local conf = {
				providers = {
					anthropic = {
						endpoint = "https://api.anthropic.com/v1/messages",
						secret = api_key,
					},
				},
				agents = {
					{
						provider = "anthropic",
						name = "ChatClaude-3-5-Haiku",
						chat = true,
						command = false,
						model = { model = "claude-3-5-haiku-20241022", temperature = 0.8, top_p = 1 },
						system_prompt = "You are a helpful AI assistant.",
					},
				},
				chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",
			}

			require("gp").setup(conf)
		end,
	},
}

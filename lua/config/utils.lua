function help_search()
	local word = vim.fn.input("Help: ")
	if word == "" then
		print("Help search cancelled.")
		return
	end

	vim.cmd("help " .. word)
end

function toggle_wrap()
	local wrap = vim.wo.wrap
	vim.wo.wrap = not wrap
	if wrap then
		print("Word wrap: OFF")
	else
		print("Word wrap: ON")
	end
end

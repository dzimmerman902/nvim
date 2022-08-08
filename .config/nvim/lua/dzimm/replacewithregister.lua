local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>r", "<Plug>ReplaceWithRegisterOperator", {noremap = true, silent = true})
keymap("n", "<leader>rr", "<Plug>ReplaceWithRegisterLine", {noremap = true, silent = true})

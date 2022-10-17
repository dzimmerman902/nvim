vim.cmd 'colorscheme material'
vim.g.material_style = "deep ocean"
require('material').setup()
--
-- local status_ok, catppuccin = pcall(require, "catppuccin")
-- if not status_ok then
-- 	return
-- end
--
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
--
-- catppuccin.setup({
--     styles = {
--         functions = { "bold" }
--     }
-- })
--
-- vim.api.nvim_command "colorscheme catppuccin"

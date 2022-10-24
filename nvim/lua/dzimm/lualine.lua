local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

local dracula = require 'lualine.themes.dracula'

lualine.setup {
    options = { theme = dracula },
}

local M = {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
}

function M.config()
    require('copilot').setup {
        -- suggestion = { enable = false },
        -- panel = { enable = false },
    }
end

return M

local M = {
    'github/copilot.vim',
    cmd = 'Copilot',
    event = 'InsertEnter',
}

function M.config()
    require('copilot').setup {}
end

return M

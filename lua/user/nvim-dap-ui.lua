local M = {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
        'folke/neodev.nvim',
        'neovim/nvim-lspconfig',
    },
}

function M.config()
    local dap, dapui = require 'dap', require 'dapui'

    dap.listeners.before.attach.dapui_config = function()
        dapui.open({ reset = true })
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
    -- dap.listeners.before.event_terminated.dapui_config = function()
    --     dapui.close()
    -- end
    -- dap.listeners.before.event_exited.dapui_config = function()
    --     dapui.close()
    -- end

    local wk = require 'which-key'

    -- stylua: ignore
    wk.register {
        ['<leader>du'] = { function() dapui.toggle({ reset = true }) end, "Toggle Dap UI" }
    }

    require('neodev').setup {
        library = { plugins = { 'nvim-dap-ui' }, types = true },
    }

    require('dapui').setup()
end

return M

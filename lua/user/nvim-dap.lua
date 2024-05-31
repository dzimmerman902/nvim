local M = {
    'mfussenegger/nvim-dap',
}

function M.config()
    local wk = require 'which-key'
    local dap = require 'dap'

    -- stylua: ignore
    wk.register {
        ["<leader>dB"] = { function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "Set Breakpoint" },
        ["<leader>db"] = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
        ["<leader>dc"] = { function() require("dap").continue() end, "Continue" },
        ["<leader>da"] = { function() require("dap").continue({ before = get_args }) end, "Continue" },
        ["<leader>dC"] = { function() require("dap").run_to_cursor() end, "Run To Cursoer" },
        ["<leader>dg"] = { function() require("dap").goto_() end, "Go To" },
        ["<leader>di"] = { function() require("dap").step_into() end, "Step Into" },
        ["<leader>dj"] = { function() require("dap").down() end, "Down" },
        ["<leader>dk"] = { function() require("dap").up() end, "Up" },
        ["<leader>dl"] = { function() require("dap").run_last() end, "Run Last" },
        ["<leader>dO"] = { function() require("dap").step_out() end, "Set Out" },
        ["<leader>do"] = { function() require("dap").step_over() end, "Step Over" },
        ["<leader>dp"] = { function() require("dap").pause() end, "Pause" },
        ["<leader>dr"] = { function() require("dap").repl.toggle() end, "Repl Toggle" },
        ["<leader>ds"] = { function() require("dap").session() end, desc = "Session", "Session" },
        ["<leader>dt"] = { function() require("dap").terminate() end, "Terminate" },
        ["<leader>dw"] = { function() require("dap.ui.widgets").hover() end, "Hover" }
    }

    dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = { os.getenv 'HOME' .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
    }
    dap.configurations.javascript = {
        {
            name = '__tests__',
            type = 'node2',
            request = 'launch',
            program = '${workspaceFolder}/__tests__/index.js',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            name = 'Launch',
            type = 'node2',
            request = 'launch',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            -- For this to work you need to make sure the node process is started with the `--inspect` flag.
            name = 'Attach to process',
            type = 'node2',
            request = 'attach',
            processId = require('dap.utils').pick_process,
        },
    }
    dap.configurations['local-lua'] = {}
end

return M

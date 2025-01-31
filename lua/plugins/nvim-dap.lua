return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',
    },
    keys = {
        -- stylua: ignore start
        { "<leader>d",  "",                                                                                   desc = "+debug",                 mode = { "n", "v" } },
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
        { "<leader>dc", function() require("dap").continue() end,                                             desc = "Run/Continue" },
        { "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
        { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
        { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
        { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
        { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
        { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
        { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
        { "<leader>dO", function() require("dap").step_out() end,                                             desc = "Step Out" },
        { "<leader>do", function() require("dap").step_over() end,                                            desc = "Step Over" },
        { "<leader>dp", function() require("dap").pause() end,                                                desc = "Pause" },
        { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
        { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
        { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
        { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
        { "<leader>du", function() require("dapui").toggle({ reset = true }) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
        -- stylua: ignore end
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        require('mason-nvim-dap').setup({
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
            },
        })

        dapui.setup({
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        })

        dap.listeners.before.attach.dapui_config = function()
            dapui.open({ reset = true })
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open({ reset = true })
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dap.adapters.node2 = {
            type = 'executable',
            command = 'node',
            args = {
                os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js',
            },
        }

        dap.configurations.javascript = {
            {
                name = 'Tests',
                type = 'node2',
                request = 'launch',
                program = '${workspaceFolder}/__tests__/index.js',
                cwd = '${workspaceFolder}',
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
        }

        vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
        vim.fn.sign_define(
            'DapBreakpointCondition',
            { text = '🔵', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' }
        )
        vim.fn.sign_define('DapLogPoint', { text = '📍', texthl = 'DapLogPoint', linehl = '', numhl = '' })
        vim.fn.sign_define(
            'DapStopped',
            { text = '⭐', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' }
        )
    end,
}

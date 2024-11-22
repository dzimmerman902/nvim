return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
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
    -- stylua: ignore end
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = {
        os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js",
      },
    }

    dap.configurations.javascript = {
      {
        name = "Tests",
        type = "node2",
        request = "launch",
        program = "${workspaceFolder}/__tests__/index.js",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
      {
        name = "Launch",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
    }

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
  end,
}

local status_ok1, dap = pcall(require, 'dap')
if not status_ok1 then
    return
end

local status_ok2, dap_vscode_js = pcall(require, 'dap-vscode-js')
if not status_ok2 then
    return
end

dap_vscode_js.setup {
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
}

for _, language in ipairs { 'typescript', 'javascript' } do
    dap.configurations[language] = {
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch test',
            program = '__tests__/index.js',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            console = 'integratedTerminal',
            protocol = 'inspector',
        },
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            console = 'integratedTerminal',
            protocol = 'inspector',
        },
        {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            console = 'integratedTerminal',
            protocol = 'inspector',
        },
    }
end

-- dap.adapters.node2 = {
--     type = 'executable',
--     command = 'node',
--     args = { os.getenv 'HOME' .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
-- }
--
-- dap.configurations.javascript = {
--     {
--         name = 'Launch Test',
--         type = 'node2',
--         request = 'launch',
--         program = '${workspaceFolder}/__tests__/index.js',
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = 'inspector',
--         console = 'integratedTerminal',
--     },
--     {
--         name = 'Launch File',
--         type = 'node2',
--         request = 'launch',
--         program = '${file}',
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = 'inspector',
--         console = 'integratedTerminal',
--     },
--     {
--         -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--         name = 'Attach to process',
--         type = 'node2',
--         request = 'attach',
--         processId = require('dap.utils').pick_process,
--     },
-- }

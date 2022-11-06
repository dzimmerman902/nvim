local status_ok1, dap = pcall(require, 'dap')
if not status_ok1 then
    return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<LEADER>db', ':DapToggleBreakpoint<CR>', opts)
keymap('n', '<LEADER>dB', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap('n', '<LEADER>dc', ':DapContinue<CR>', opts)
keymap('n', '<LEADER>de', ':DapStepOut<CR>', opts)
keymap('n', '<LEADER>di', ':DapStepInto<CR>', opts)
keymap('n', '<LEADER>dl', ":lua require'dap'.run_last()<CR>", opts)
keymap('n', '<LEADER>do', ':DapStepOver<CR>', opts)
keymap('n', '<LEADER>dr', ":lua require'dap'.repl.open()<CR>", opts)
keymap('n', '<leader>dR', ":lue require'dap'.clear_breakpoints()<CR>", opts)
keymap('n', '<LEADER>dt', ':DapTerminate<CR>', opts)
keymap('n', '<leader>dw', "lua: require'dap.ui.widgets'.hover()<CR>", opts)

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🟦', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })

require('dap-vscode-js').setup {
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
}

-- dap.adapters.node2 = {
--     type = 'executable',
--     command = 'node',
--     args = { os.getenv 'HOME' .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
-- }
--
for _, language in ipairs { 'typescript', 'javascript' } do
    dap.configurations[language] = {
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch test',
            program = '__tests__/index.js',
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
            protocal = 'inspector',
            sourceMaps = true,
        },
        {
            type = 'node2',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
        },
        {
            type = 'node2',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
        },
    }
end

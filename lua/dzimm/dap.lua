local status_ok1, dap = pcall(require, 'dap')
if not status_ok1 then
    return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<LEADER>dc', ':DapContinue<CR>', opts)
keymap('n', '<LEADER>dt', ':DapTerminate<CR>', opts)
keymap('n', '<LEADER>db', ':DapToggleBreakpoint<CR>', opts)
keymap('n', '<leader>dR', ":lue require'dap'.clear_breakpoints()<CR>")
keymap('n', '<LEADER>dc', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap('n', '<LEADER>dr', ":lua require'dap'.repl.open()<CR>", opts)
keymap('n', '<LEADER>dl', ":lua require'dap'.run_last()<CR>", opts)
keymap('n', '<LEADER>di', ':DapStepInto<CR>', opts)
keymap('n', '<LEADER>do', ':DapStepOver<CR>', opts)
keymap('n', '<LEADER>de', ':DapStepOut<CR>', opts)
keymap('n', '<leader>dw', "lua: require'dap.ui.widgets'.hover()<CR>", opts)

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🟦', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv 'HOME' .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

for _, language in ipairs { 'typescript', 'javascript' } do
    dap.configurations[language] = {
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch test',
            program = '__tests__/index.js',
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
        },
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
        },
        {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
        },
    }
end

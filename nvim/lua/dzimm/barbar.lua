local status_ok, dap = pcall(require, 'dap')
if not status_ok then
    return
end

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv 'HOME' .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
    {
        name = 'Launch Test',
        type = 'node2',
        request = 'launch',
        program = '${workspaceFolder}\\__tests__\\index.js',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        name = 'Launch File',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
}

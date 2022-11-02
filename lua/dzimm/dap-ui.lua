local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then
    return
end

local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
    return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<LEADER>dui', ":lua require('dapui').toggle()<CR>", opts)

dapui.setup {
    icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
    },
    expand_lines = vim.fn.has 'nvim-0.7' == 1,
    layouts = {
        {
            elements = {
                { id = 'scopes', size = 0.25 },
                'breakpoints',
                'stacks',
                'watches',
            },
            size = 40, -- 40 columns
            position = 'right',
        },
        {
            elements = {
                'repl',
                { id = 'console', size = 0.75 },
            },
            size = 0.25, -- 25% of total lines
            position = 'bottom',
        },
    },
    controls = {
        enabled = true,
        element = 'repl',
        icons = {
            pause = '',
            play = '',
            step_into = '',
            step_over = '',
            step_out = '',
            step_back = '',
            run_last = '↻',
            terminate = '□',
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = 'single',
        mappings = {
            close = { 'q', '<Esc>' },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil,
        max_value_lines = 100,
    },
}

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end

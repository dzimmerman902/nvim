local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
    return
end

toggleterm.setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
            border = 'Normal',
            background = 'Normal',
        },
    },
    winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end,
    },
}

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<CMD>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<CMD>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<CMD>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<CMD>wincmd l<CR>]], opts)
end

vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
    cmd = 'lazygit -debug',
    hidden = true,
    start_in_insert = true,
    direction = 'float',
    float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
            border = 'Normal',
            background = 'Normal',
        },
    },
}

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<LEADER>gg', '<CMD>lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true })

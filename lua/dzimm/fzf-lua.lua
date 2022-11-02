local status_ok, fzf_lua = pcall(require, 'fzf-lua')
if not status_ok then
    return
end

local actions = require 'fzf-lua.actions'

fzf_lua.setup {
    files = {
        find_opts = [[-type f -not -path '*/\.git/*' -a -not -path '*/node_modules/*' -a -not -path '*/.next/*' -a -not -path '*/venv/*' -printf '%P\n']],
    },
    actions = {
        -- These override the default tables completely
        -- no need to set to `false` to disable an action
        -- delete or modify is sufficient
        files = {
            ['default'] = actions.file_edit_or_qf,
            ['ctrl-s'] = actions.file_split,
            ['ctrl-v'] = actions.file_vsplit,
            ['ctrl-t'] = actions.file_tabedit,
            ['alt-q'] = actions.file_sel_to_qf,
            ['alt-l'] = actions.file_sel_to_ll,
        },
        buffers = {
            -- providers that inherit these actions:
            --   buffers, tabs, lines, blines
            ['default'] = actions.buf_edit,
            ['ctrl-s'] = actions.buf_split,
            ['ctrl-v'] = actions.buf_vsplit,
            ['ctrl-t'] = actions.buf_tabedit,
        },
    },
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<LEADER>ff', ":lua require'fzf-lua'.files({ winopts = { preview = { vertical = 'down:33%' }}})<CR>", opts)
keymap('n', '<LEADER>fg', ":lua require'fzf-lua'.live_grep()<CR>", opts)
keymap('n', '<LEADER>fc', ":lua require'fzf-lua'.command_history()<CR>", opts)
keymap('n', '<LEADER>fr', ":lua require'fzf-lua'.registers()<CR>", opts)

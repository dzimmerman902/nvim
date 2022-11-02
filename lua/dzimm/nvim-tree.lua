local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<LEADER>ee', ':NvimTreeToggle<CR>', opts)
keymap('n', '<LEADER>ef', ':NvimTreeFocus<CR>', opts)
keymap('n', '<LEADER>ec', ':NvimTreeCollapse<CR>', opts)

nvim_tree.setup {
    create_in_closed_folder = true,
    renderer = {
        root_folder_modifier = ':t',
        icons = {
            glyphs = {
                default = '',
                symlink = '',
                folder = {
                    arrow_open = '',
                    arrow_closed = '',
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                    symlink_open = '',
                },
                git = {
                    unstaged = '',
                    staged = 'S',
                    unmerged = '',
                    renamed = '➜',
                    untracked = 'U',
                    deleted = '',
                    ignored = '◌',
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    view = {
        side = 'left',
    },
    filters = {
        dotfiles = false,
        custom = {
            '^.git$',
        },
    },
}

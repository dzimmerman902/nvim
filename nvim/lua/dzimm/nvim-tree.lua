local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

nvim_tree.setup {
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
        side = "right",
        float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },
    },
    filters = {
        dotfiles = false,
    },
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ee', ':NvimTreeToggle<cr>', opts)
keymap('n', '<leader>ef', ':NvimTreeFocus<cr>', opts)
keymap('n', '<leader>ec', ':NvimTreeCollapse<cr>', opts)

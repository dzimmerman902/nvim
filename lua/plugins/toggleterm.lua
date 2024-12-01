return {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
        shell = '/bin/zsh',
        open_mapping = [[<c-\>]],
        on_open = function(term)
      -- stylua: ignore
      vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-k>', '<Cmd>wincmd k<CR>', { noremap = true, silent = true })
        end,
    },
}

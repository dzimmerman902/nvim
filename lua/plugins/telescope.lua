return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope, builtin = require('telescope'), require('telescope.builtin')

    -- TELESCOPE
    -- stylua: ignore start
    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
        -- stylua: ignore end
        --
        telescope.setup({
            defaults = {
                file_ignore_pattern = { 'node_modules' },
            },
        })
    end,
}

-- return {
--     'folke/tokyonight.nvim',
--     lazy = true,
--     opts = { style = 'moon' },
--     init = function()
--         vim.cmd('colorscheme tokyonight')
--     end,
-- }

return {
    'marko-cerovac/material.nvim',
    init = function()
        -- vim.g.material_style = "darker"
        vim.cmd('colorscheme material')
    end,
}

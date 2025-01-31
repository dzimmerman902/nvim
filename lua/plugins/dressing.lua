-- With the release of Neovim 0.6 we were given the start of extensible core UI hooks (vim.ui.select and vim.ui.input).
-- They exist to allow plugin authors to override them with improvements upon the default behavior, so that's exactly what we're going to do.

-- It is a goal to match and not extend the core Neovim API.
-- All options that core respects will be respected, and we will not accept any custom parameters or options in the functions.
-- Customization will be done entirely using a separate configuration method.

return {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {},
}

local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

treesitter.setup {
    autotag = {
        enable = true,
    },
    ensure_installed = { 'typescript', 'javascript' },
    highlight = {
        enable = true,
    },
    auto_install = true,
    indent = {
        enable = true,
    },
}

vim.cmd 'autocmd! FileType html set'

local options = {
    autoread = true,
    background = 'dark',
    backup = false,
    cmdheight = 2,
    completeopt = { 'menuone', 'noinsert', 'noselect' },
    cursorline = true,
    encoding = 'UTF-8',
    expandtab = true,
    exrc = true,
    guifont='SauceCodePro Nerd Font 11',
    hlsearch = false,
    hidden = true,
    incsearch = true,
    nu = true,
    omnifunc = 'htmlcomplete#CompleteTags',
    relativenumber = true,
    scrolloff = 8,
    shiftwidth = 4,
    showmode = true,
    sidescrolloff = 8,
    signcolumn = 'yes',
    smartindent = true,
    softtabstop = 4,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    syntax = 'enable',
    tabstop = 4,
    termguicolors = true,
    undofile = true,
    updatetime = 50,
    wrap = false,
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.gitblame_enabled = 1
vim.g.gitblame_message_template = '<author> • <summary>'
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
vim.g.WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

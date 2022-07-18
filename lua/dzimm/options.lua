local options = {
    background=dark,
    backup = false,
    cmdheight = 2,
    completeopt = { "menuone", "noinsert", "noselect" },
    cursorline = true,
    expandtab = true,
    exrc = true,
    hlsearch = false,
    hidden = true,
    incsearch = true,
    swapfile = false,
    nu = true,
    relativenumber = true,
    scrolloff = 8,
    shiftwidth = 4,
    showmode = true,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartindent = true,
    softtabstop = 4,
    splitbelow = true,
    splitright = true,
    syntax = 'enable',
    tabstop = 4,
    termguicolors = true,
    undofile = true,
    updatetime = 50,
    wrap = false
}

vim.opt.shortmess:append("c") 

for k, v in pairs(options) do
    vim.opt[k] = v
end


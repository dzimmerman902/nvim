local options = {
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    cmdheight = 2,
    relativenumber = true,
    scrolloff = 8,
    sidescrolloff = 8,
    hlsearch = false,
    incsearch = true,
    updatetime = 50,
    cursorline = true,
}

vim.opt.shortmess:append("c") 

for k, v in pairs(options) do
    vim.opt[k] = v
end


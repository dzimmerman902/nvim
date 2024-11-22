local map = vim.keymap.set

map("n", "<leader>qq", ":q<cr>", { noremap = true, silent = true })

map("i", "jk", "<esc>", { noremap = true, silent = true })
map("i", "kj", "<esc>", { noremap = true, silent = true })

map("n", "<leader>e", ":Ex<cr>", { noremap = true, silent = true })

map("n", "<S-h>", "<cmd>bprevious<cr>", { noremap = true, silent = true })
map("n", "<S-l>", "<cmd>bnext<cr>", { noremap = true, silent = true })
map("n", "<leader>bd", ":bd<cr>", { noremap = true, silent = true })
map("n", "<leader>bw", ":w<cr>", { noremap = true, silent = true })

map("n", "<c-j>", "<c-w>j", { noremap = true, silent = true })
map("n", "<c-k>", "<c-w>k", { noremap = true, silent = true })
map("n", "<c-l>", "<c-w>l", { noremap = true, silent = true })
map("n", "<c-h>", "<c-w>h", { noremap = true, silent = true })

map("n", "<leader>uh", ":lua help_search()<cr>", { noremap = true, silent = true })

map("n", "<leader>l", ":Lazy<cr>", { noremap = true, silent = true })

map("n", "<esc>", "<cmd>noh<cr><esc>", { noremap = true, silent = true })
map("i", "<esc>", "<cmd>noh<cr><esc>", { noremap = true, silent = true })

map("n", "<leader>-", "<C-W>s", { noremap = true, silent = true })
map("n", "<leader>|", "<C-W>v", { noremap = true, silent = true })
map("n", "<leader>wd", "<C-W>c", { noremap = true, silent = true })

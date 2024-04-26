local M = {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
        vim.fn['mkdp#util#install']()
    end,
}

function M.config()
    local wk = require 'which-key'

    wk.register {
        ['<leader>mp'] = { '<cmd>MarkdownPreview<cr>', 'Markdown Preview' },
        ['<leader>ms'] = { '<cmd>MarkdownPreviewStop<cr>', 'Markdown Preview Stop' },
        ['<leader>mt'] = { '<cmd>MarkdownPreviewToggle<cr>', 'Markdown Preview Toggle' },
    }
end

return M

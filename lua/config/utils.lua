function help_search()
    local word = vim.fn.input('Help: ')
    if word == '' then
        print('Help search cancelled.')
        return
    end

    vim.cmd('help ' .. word)
end

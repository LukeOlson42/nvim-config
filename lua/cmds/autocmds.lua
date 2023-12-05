local autocmd = vim.api.nvim_create_autocmd

autocmd('CmdlineEnter', {
    command = 'command! Term :right vsplit term://$SHELL',
})

autocmd('TermOpen', {
    command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
    pattern = '',
    callback = function()
        vim.api.nvim_feedkeys('G', 'n', false)
        vim.keymap.set('n', 'q', function()      -- just click q to leave that buffer :D
            vim.cmd("bd!")
            end,
            {
                buffer = true
            }
       )
    end
})

autocmd('BufLeave', {
    pattern = 'term:*',
    command = 'stopinsert',
})


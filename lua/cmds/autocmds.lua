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
        vim.api.nvim_feedkeys('G', 'n', false)                                       -- make sure we dont get left behind
        vim.keymap.set('n', 'q', function() vim.cmd("bd!") end, { buffer = true })   -- just click q to leave that buffer :D
    end
})

autocmd('BufLeave', {
    pattern = 'term:*',
    command = 'stopinsert',
})


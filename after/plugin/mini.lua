require('mini.move').setup({
    mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        down = '<S-j>',
        up = '<S-k>',
        -- Move current line in Normal mode
        line_left = '<M-h>',
        line_right = '<M-l>',
        line_down = '<M-j>',
        line_up = '<M-k>',
    },

    -- Options which control moving behavior
    options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
    },
})

require('mini.comment').setup({
    options = {
        custom_commentstring = nil,
        ignore_blank_line = true,
        start_of_line = false,
        pad_comment_parts = true,
    },
    mappings = {
        comment = '<leader>c',
    },
    hooks = {
        pre = function() end,
        post = function() end,
    },
})

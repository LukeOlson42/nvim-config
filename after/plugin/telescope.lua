local builtin = require('telescope.builtin')

require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            "SDK"
        }
    }
})

-- ezpz search with fd
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>goto', builtin.git_files, {})

-- built in grep search pog
vim.keymap.set('n', '<leader>grep', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- ezpz search with rg
vim.keymap.set('n', '<leader>find', builtin.live_grep, {})


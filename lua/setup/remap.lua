vim.g.mapleader = " "
local remap = vim.keymap.set

-- various useful keybinds
remap("n", "U", "<C-r>")
remap('n', '<leader>new', 'o<Esc>k')
remap("n", "<leader>out", vim.cmd.Ex)

-- expand braces
-- remap("i", "<C-[>", "{<CR><LF>}<Esc>ki<Tab>")
-- remap("i", "[", "[]<Esc>i") -- maybe make command to enable brace expansion?
remap("i", "<C-h>", "<C-o><S-i>") 
remap("i", "<C-l>", "<C-o><S-a>") 
-- Working with split windows
remap("n", "<leader>sp", "<C-w>v")
remap("n", "<C-l>", "<C-w>l")
remap("n", "<C-h>", "<C-w>h")

-- fancier text selections
remap('n', "q", "<nop>")
remap('n', "Q", "<nop>")
remap('n', "<leader>l", "vab")
remap('n', "<leader>k", "viB")
remap('n', "<leader>fix", "viB=")
remap('n', "<leader>grab", "[mkv][")

-- help how do i quit
remap('i', "<C-c>", "<Esc>l")
remap('v', "<C-c>", "<Esc>")



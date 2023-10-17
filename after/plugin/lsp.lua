-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
      ghost_text = true -- i love ghost text
  },
  mapping = {
    ['<C-u>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-d>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
})

lsp.set_preferences({
    sign_icons = false,
})


lsp.ensure_installed({
    'rust_analyzer',
    'clangd',
})

vim.opt.signcolumn = 'no'

-- keymaps here ???

lsp.setup()


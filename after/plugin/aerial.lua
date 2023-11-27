local config = {
    layout = {
        default_direction = "prefer_right",
        placement = "edge",
        resize_to_content = true,
        max_width = { 0.2 },
        min_width = { 0.2 },
    },

    backends = { "treesitter", "lsp", "markdown" },

    lsp = {
        diagnostics_trigger_update = true,
        update_when_errors = true,
    },

    filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Struct",
        "Function",
        "Variable",
    },

    highlight_closest = true,
    hightlight_on_hover = true,
    lazy_load = true,
    nerd_font = 'auto',
    close_on_select = true,

    keymaps = {
        ["K"] = "actions.show_help",
        ["<CR>"] = "actions.jump",
        ["<C-n>"] = "actions.next",
        ["<C-p>"] = "actions.prev",
        ["q"] = "actions.close",
    },

    guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
    },

    ignore = {
        buftypes = "special",
        wintypes = "special",
    },
}

vim.keymap.set('n', '<C-m>', "<cmd>AerialToggle!<CR>")

-- require('aerial').setup(config)

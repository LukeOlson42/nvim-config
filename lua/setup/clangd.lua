require('lspconfig').clangd.setup {
        cmd = {
            "clangd",
            "--header-insertion=never",
        },
        filetypes = {"c", "cpp", "objc", "objcpp"},
}

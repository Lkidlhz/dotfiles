require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "texlab",
        "rust_analyzer",
        "svlangserver",
        -- "svls",
    }
})

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 
-- require("lspconfig").lua_ls.setup {
--     capabilities = capabilities,
-- }

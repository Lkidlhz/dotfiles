# neovim_config

## about lsp & complete

```lua
-- edit in $MYNVIMCF/lua/plugins/plugins_config/mason_nvim.lua
-- use :Mason<CR> to look for the name

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "texlab",
        "rust_analyzer",
    }
})
```

```lua
-- edit in $MYNVIMCF/lua/plugins/plugins_config/nvim_cmp.lua

-- EXAMPLE
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- }
-- such as:
require('lspconfig')["lua_ls"].setup {
    capabilities = capabilities
}
```

```lua
-- edit in $MYNVIMCF/lua/plugins/plugins_config/nvim_lsp.lua

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
lspconfig.clangd.setup{}
lspconfig.texlab.setup{}
lspconfig.lua_ls.setup{}
```

## telescope

if want to search code, not only the filename,
need `:Telescope live_grep`, which rely on `ripgrep`

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.ts_ls.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
lspconfig.clangd.setup{
	cmd = {
		-- "~/.local/share/nvim/mason/bin/clangd",
		"--query-driver=*arm-none-eabi*"
	}
}
lspconfig.texlab.setup{}
lspconfig.lua_ls.setup{}
--local nvim_lsp = require('lspconfig')
lspconfig.svlangserver.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name

    if path == '~/Desktop/kid/FPGA/test' then
      client.config.settings.systemverilog = {
        includeIndexing     = {"**/*.{sv,svh,v}"},
        excludeIndexing     = {"test/**/*.sv*"},
        defines             = {},
        launchConfiguration = "/tools/verilator -sv -Wall --lint-only",
        formatCommand       = "/tools/verible-verilog-format"
      }
    elseif path == '/path/to/project2' then
      client.config.settings.systemverilog = {
        includeIndexing     = {"**/*.{sv,svh}"},
        excludeIndexing     = {"sim/**/*.sv*"},
        defines             = {},
        launchConfiguration = "/tools/verilator -sv -Wall --lint-only",
        formatCommand       = "/tools/verible-verilog-format"
      }
    end

    client.notify("workspace/didChangeConfiguration")
    return true
  end
}
-- lspconfig.svls.setup{}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'U', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

-- vim.diagnostic.open_float()
-- vim.keymap.set('n', '<S-e>', vim.diagnostic.open_float)

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   -- group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--   -- callback = function ()
--   --   vim.diagnostic.open_float(nil, {focus=false})
--   -- end
--   group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
--   callback = function ()
--     vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
--   end
-- })

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
local format = function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)
end
local lsp = require("lspconfig")
lsp.rust_analyzer.setup({
    cmd = { "rust-analyzer" },
    capabilities = capabilities,
    on_attach = format,
    settings = {
        ["rust_analyzer"] = {
            diagnostics = {
                enable = false,
            },
            checkOnSave = {
                command = "clippy",
            }
        }
    }
})
lsp.lua_ls.setup({ capabilities = capabilities, on_attach = format })
lsp.texlab.setup({ capabilities = capabilities, on_attach = format })

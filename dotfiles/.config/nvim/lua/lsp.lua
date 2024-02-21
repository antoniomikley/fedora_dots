local capabilities = require("cmp_nvim_lsp").default_capabilities()
local format = function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)
end
local lsp = require("lspconfig")
lsp.rust_analyzer.setup({ capabiliies = capabilities, on_attach = format })
lsp.lua_ls.setup({ capabiliies = capabilities, on_attach = format })
lsp.texlab.setup({ capabilities = capabilities, on_attach = format })

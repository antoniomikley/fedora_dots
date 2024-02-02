return {
    {
        "williamboman/mason.nvim",
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason").setup()
                require("mason-lspconfig").setup({
                    automatic_installation = true
                })
            end
        },
        "neovim/nvim-lspconfig",
        { "lukas-reineke/lsp-format.nvim", config = true },
    }
}

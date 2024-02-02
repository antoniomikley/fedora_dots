return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        enable = true,
        priority = 1000,
        config = function()
            vim.opt.background = "dark"
            vim.cmd.colorscheme("oxocarbon")
        end,
    }
}

return {
    {
        "lervag/vimtex",
        ft = "tex",
        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.keymap.set("v", "<leader>fm", [[:'<,'>!fmt<CR><CR>]])
        end,
    }
}

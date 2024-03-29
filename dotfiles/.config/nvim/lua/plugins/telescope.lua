return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "nvim-tree/nvim-web-devicons",
        },
        branch = "0.1.x",
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {
                        "node modules", "build", "gradle", "*.class"
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    }
                },
                require("telescope").load_extension("fzf"),
            })
        end,
    }
}

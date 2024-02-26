return {
    {
        "mfussenegger/nvim-jdtls",
        lazy = true,
        ft = "java",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    local root_dir = require("jdtls.setup").find_root({ "gradlew", "mvnw", ".git" })
                    local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
                    local jdtls_path = require("mason-registry").get_package("jdtls"):get_install_path()
                    local workspace_dir = os.getenv("HOME") .. "/.eclipse/workspaces/" .. project_name
                    local jar_path = string.gsub(
                        io.popen("find " .. jdtls_path .. ' -name "org.eclipse.equinox.launcher_*.jar"'):read("*a"), "\n",
                        "")
                    local config = {
                        cmd = {
                            "java",
                            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                            "-Dosgi.bundles.defaultStartLevel=4",
                            "-Declipse.product=org.eclipse.jdt.ls.core.product",
                            "-Dlog.protocol=true",
                            "-Dlog.level=ALL",
                            "-Xmx1g",
                            "--add-modules=ALL-SYSTEM",
                            "--add-opens", "java.base/java.util=ALL-UNNAMED",
                            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                            "-jar", jar_path,
                            "-configuration", jdtls_path .. "/config_linux",
                            "-data", workspace_dir,
                        },
                        root_dir = root_dir,
                    }
                    require("jdtls").start_or_attach(config)
                end,
            })
            return true
        end,
    }
}

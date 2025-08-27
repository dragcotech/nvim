return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua",
                    "shfmt",
                    "java-test",
                    "java-debug-adapter",
                    "clang-format",
                    "codelldb",
                    "google-java-format",
                },
            })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = {
                    exclude = {
                        "jdtls",
                    },
                },
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "jdtls",
                    "marksman",
                },
            })
        end,
    },
}

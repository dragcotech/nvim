return {
    -- Mason
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

    -- Mason Tool Installer
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },

        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- C / C++
                    "clang-format",

                    -- Lua
                    "stylua",

                    -- Shell
                    "shfmt",

                    -- Java
                    "java-test",
                    "java-debug-adapter",
                    "google-java-format",

                    -- Debugger
                    "codelldb",

                    -- Python
                    "ruff",

                    -- JavaScript / TypeScript / HTML / CSS / JSON
                    "prettier",

                    -- Rust
                    "rustfmt",
                },
                auto_update = false,
                run_on_start = true,
            })
        end,
    },

    -- Mason LSP Config
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = {
                    exclude = {
                        "jdtls",
                    },
                },

                ensure_installed = {
                    -- Lua
                    "lua_ls",

                    -- C / C++
                    "clangd",

                    -- Java
                    "jdtls",

                    -- Markdown
                    "marksman",

                    -- Python
                    "pyright",

                    -- JavaScript / TypeScript
                    "ts_ls",

                    -- Rust
                    "rust_analyzer",

                    -- HTML / CSS
                    "html",
                    "cssls",
                },
            })
        end,
    }
}